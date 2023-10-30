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

class NewNetworkManager {
  final _logger = Logger();

  static final NewNetworkManager _newNetworkManager = NewNetworkManager();

  static NewNetworkManager get instance => _newNetworkManager;

  Future<void> initialize() async {
    _logger.i("instance initialized");
  }

  /// Call Get API
  Future<Response?> callGetAPI({
    required String url,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? myHeaders,
  }) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

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
    } on DioError catch (ex) {
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
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

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
    } on DioError catch (ex) {
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
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

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
    } on DioError catch (ex) {
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
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

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
    } on DioError catch (ex) {
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
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

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
    } on DioError catch (ex) {
      _logger.e("dioError: -> ${ex.response?.statusCode} | ${ex.response} ");
      return ex.response;
    }
    //By Default null
    return null;
  }
}
