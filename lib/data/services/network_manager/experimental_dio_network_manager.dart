// Created by Tayyab Mughal on 30/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_v2/app/app_resources/app_resources.dart';

enum HttpMethod { get, post, put, patch, delete }

class ApiResponse<T> {
  final int statusCode;
  final T? data;

  ApiResponse(this.statusCode, this.data);
}

class FinalAPIDataResult<T> {
  /// response Type: 0: Error, 1: Success, -1: Exception
  final int responseType;
  final String? message;
  final T? resultData;

  FinalAPIDataResult({
    required this.responseType,
    required this.resultData,
    required this.message,
  });
}

class DioNetworkError extends Error {
  final String message;

  DioNetworkError(this.message);

  @override
  String toString() => message;
}

class DioRequestError extends DioNetworkError {
  DioRequestError(String message) : super(message);
}

class DioConnectionError extends DioNetworkError {
  DioConnectionError() : super('No Internet Connection Available');
}

class DioHttpError extends DioNetworkError {
  final int statusCode;

  DioHttpError(this.statusCode) : super('HTTP Error: $statusCode');
}

class ExperimentalDioNetworkManager {
  final _logger = Logger();

  static final ExperimentalDioNetworkManager _experimentalDioNetworkManager =
      ExperimentalDioNetworkManager();

  static ExperimentalDioNetworkManager get instance =>
      _experimentalDioNetworkManager;

  /// Initialize
  Future<void> initialize() async {
    _logger.i("Experimental Dio Network Manager instance initialized");
  }

  /// Create Dio Adapter
  Dio _createDio() {
    final dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
    return dio;
  }

  /// Perform Http Request
  Future<Response?> _performRequest({
    required String url,
    // required String httpMethod,
    required HttpMethod httpMethod, // Use the HttpMethod enum
    dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    final dio = _createDio();
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await dio.request(
          url,
          data: body,
          queryParameters: parameters,
          options: Options(
            method: _httpMethodToString(method: httpMethod),
            headers: myHeaders,
          ),
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } on DioException catch (ex) {
        _logger.e(
          "dioError: -> StatusCode: ${ex.response?.statusCode} | Error: ${ex.error.toString()} | Response: ${ex.response}",
        );
        return ex.response;
      }
    } else {
      Toasts.getErrorToast(text: "No Internet Connection Available");
      _logger.e("No Internet Connection Available");
      return null;
    }
  }

  /// Parse HttpMethod Enum to String
  String _httpMethodToString({required HttpMethod method}) {
    // Convert the enum to its string representation
    switch (method) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.delete:
        return 'DELETE';
    }
  }

  /// Make API Call
  Future<FinalAPIDataResult> callAPI({
    required String url,
    required HttpMethod httpMethod, // Use the HttpMethod enum
    dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      _logger.i(
        "Url: $url, httpMethod: $httpMethod, Parameters: $parameters, myHeaders: $myHeaders",
      );

      /// Make API Call
      Response? response = await _performRequest(
        url: url,
        httpMethod: httpMethod,
        parameters: parameters,
        myHeaders: myHeaders,
      );
      _logger.i(
          "performRequestResponse: statusCode: ${response!.statusCode}, ${response.data}");

      /// Check Response data not null
      if (response.data != null) {
        /// Check the status Code
        if (response.statusCode == 500 ||
            response.statusCode == 401 ||
            response.statusCode == 400 ||
            response.statusCode == 404 ||
            response.statusCode == 406 ||
            response.statusCode == 403) {
          ///Error Handling here:
          return FinalAPIDataResult(
            responseType: 0,
            message: 'Error',
            resultData: response.data,
          );
        } else {
          ///Success Handling here:
          return FinalAPIDataResult(
            responseType: 1,
            message: 'Success',
            resultData: response.data,
          );
        }
      } else {
        _logger.e("return Response is: $response");
        return FinalAPIDataResult(
          responseType: -1,
          resultData: null,
          message: "Error is null: ${response}",
        );
      }
    } on DioConnectionError catch (e) {
      // Handle connectivity error
      _logger.e(e.message);
      return FinalAPIDataResult(
        responseType: -1,
        resultData: null,
        message: "Connection error: ${e.message}",
      );
    } on DioHttpError catch (e) {
      // Handle HTTP error with status code e.statusCode
      _logger.e(e.message);
      return FinalAPIDataResult(
        responseType: 0,
        resultData: null,
        message: "HTTP error with status code ${e.statusCode}",
      );
    } on DioRequestError catch (e) {
      // Handle request-specific error
      _logger.e(e.message);
      return FinalAPIDataResult(
        responseType: 0,
        resultData: null,
        message: "Request-specific error: ${e.message}",
      );
    } on DioNetworkError catch (e) {
      // Handle other custom network errors
      _logger.e(e.message);
      return FinalAPIDataResult(
        responseType: -1,
        resultData: null,
        message: "Custom network error: ${e.message}",
      );
    } catch (e) {
      // Handle unexpected errors
      _logger.e('Unexpected error: $e');
      return FinalAPIDataResult(
        responseType: -1,
        resultData: null,
        message: "Unexpected error: $e",
      );
    }
  }
}
