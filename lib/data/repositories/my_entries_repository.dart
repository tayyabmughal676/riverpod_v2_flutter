// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v2/data/models/EntriesResponse.dart';
import 'package:riverpod_v2/data/models/data_result.dart';
import 'package:riverpod_v2/data/models/entry_model.dart';
import 'package:riverpod_v2/data/services/api_service.dart';
import 'package:riverpod_v2/data/services/network_manager/experimental_dio_network_manager.dart';

part 'my_entries_repository.g.dart';

@riverpod
MyEntriesRepository myEntriesRepository(MyEntriesRepositoryRef ref) =>
    MyEntriesRepository();

class MyEntriesRepository {
  Box<EntryModel> entryBox = Hive.box('entries');

  num isUserCount = 0;
  List categoryList = [];

  Future<DataResult<EntriesResponse>> getEntries() async {
    try {
      final entries = await ApiService.instance.getEntries();
      return DataResult(data: entries);
    } catch (e) {
      return DataResult(error: 'Failed to load entries: $e');
    }
  }

  // Future<DataResult<EntriesResponse>> getNewEntries() async {
  //   final getEntries = await ApiService.instance.getNewEntries();
  //   return DataResult(data: getEntries);
  // }

  Future<EntriesResponse> getNewEntries() async {
    /// Header
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };
    final decodeResponse = await ExperimentalDioNetworkManager.instance.callAPI(
      url: "https://api.publicapis.org/entries",
      httpMethod: HttpMethod.get,
      // myHeaders: header,
    );

    if (decodeResponse.responseType == 1) {
      //decode success response
    } else {
      //decode error response
    }

    final decodeData = decodeResponse.resultData;
    debugPrint("fromJson: ${EntriesResponse.fromJson(decodeData).count}");
    debugPrint(
      "getNewEntries: message: ${decodeResponse.message}, responseType: ${decodeResponse.responseType}, resultData: ${decodeResponse.resultData}",
    );
    return EntriesResponse.fromJson(decodeData);
  }

  void addCategory({required Entries data}) async {
    // debugPrint("selected: ${data.category}");
    categoryList.add(data.category);

    //Box
    await entryBox.put(
      data.category,
      EntryModel(
        api: data.api!,
        description: data.description!,
        auth: data.auth!,
        https: data.https!,
        cors: data.cors!,
        link: data.link!,
        category: data.category!,
      ),
    );

    debugPrint("fromBox: ${await entryBox.get(data.category)?.category}");

    debugPrint("fromSelected: ${data.category}");
    for (var value in categoryList) {
      debugPrint("value: $value");
    }
  }

  void increment() {
    isUserCount++;
    debugPrint("isUserCount:$isUserCount");
  }

  void decrement() {
    if (isUserCount > 0) {
      isUserCount--;
      debugPrint("isUserCount:$isUserCount");
    }
  }
}
