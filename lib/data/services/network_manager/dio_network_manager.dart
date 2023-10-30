// Created by Tayyab Mughal on 29/03/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_v2/app/app_resources/app_resources.dart';

/// Dio Network Manager contains:
/// Get, Post, Delete, Patch, Put requests.

class DioNetworkManager {
  final _logger = Logger();

  /// Singleton Instance
  static final DioNetworkManager _dioNetworkManager = DioNetworkManager();

  static DioNetworkManager get instance => _dioNetworkManager;

  /// Initialize
  Future<void> initialize() async {
    _logger.i(
      "Dio Network Manager instance initialized",
    );
  }

  /// Call Get API
  Future<Response?> callGetAPI({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      //Http Client Adapter
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      ///Check User Internet Connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        /// Request Response
        Response response = await dio.get(
          url,
          options: Options(headers: myHeaders),
          queryParameters: parameters,
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } else {
        Toasts.getErrorToast(text: "No Internet Connection Available");
        _logger.e("No Internet Connection Available");
      }
    } on DioException catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }

  /// Call Post API
  Future<Response?> callPostAPI({
    required String url,
    required dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      //Http Client Adapter
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      ///Check User Internet Connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        /// Request Response
        Response response = await dio.post(
          url,
          options: Options(headers: myHeaders),
          data: body,
          queryParameters: parameters,
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } else {
        Toasts.getErrorToast(text: "No Internet Connection Available");
        _logger.e("No Internet Connection Available");
      }
    } on DioException catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }

  /// Call Put API
  Future<Response?> callPutAPI({
    required String url,
    required dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      //Http Client Adapter
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      ///Check User Internet Connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        /// Request Response
        Response response = await dio.put(
          url,
          options: Options(headers: myHeaders),
          data: body,
          queryParameters: parameters,
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } else {
        Toasts.getErrorToast(text: "No Internet Connection Available");
        _logger.e("No Internet Connection Available");
      }
    } on DioException catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }

  /// Call Patch API
  Future<Response?> callPatchAPI({
    required String url,
    required dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      //Http Client Adapter
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      ///Check User Internet Connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        /// Request Response
        Response response = await dio.patch(
          url,
          options: Options(headers: myHeaders),
          data: body,
          queryParameters: parameters,
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } else {
        Toasts.getErrorToast(text: "No Internet Connection Available");
        _logger.e("No Internet Connection Available");
      }
    } on DioException catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }

  /// Call Delete API
  Future<Response?> callDeleteAPI({
    required String url,
    required dynamic body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      //Http Client Adapter
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // Don't trust any certificate just because their root cert is trusted.
          final HttpClient client =
              HttpClient(context: SecurityContext(withTrustedRoots: false));
          // You can test the intermediate / root cert here. We just ignore it.
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      ///Check User Internet Connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        /// Request Response
        Response response = await dio.delete(
          url,
          options: Options(headers: myHeaders),
          data: body,
          queryParameters: parameters,
        );
        _logger.i("dioSuccess: -> ${response.statusCode} | $response ");
        return response;
      } else {
        Toasts.getErrorToast(text: "No Internet Connection Available");
        _logger.e("No Internet Connection Available");
      }
    } on DioException catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }
}
