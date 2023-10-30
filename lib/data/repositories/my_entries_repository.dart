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
