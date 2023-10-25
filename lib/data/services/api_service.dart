// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_v2/data/models/EntriesResponse.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  //get Entries
  Future<EntriesResponse> getEntries() async {
    final dio = Dio();
    final response = await dio.get("https://api.publicapis.org/entries");
    debugPrint("response: $response");
    final responseJson = response.data;
    debugPrint("responseJson: $responseJson");
    return EntriesResponse.fromJson(responseJson);
  }
}
