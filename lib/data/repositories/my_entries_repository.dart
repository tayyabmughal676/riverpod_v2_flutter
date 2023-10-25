// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v2/data/models/EntriesResponse.dart';
import 'package:riverpod_v2/data/models/data_result.dart';
import 'package:riverpod_v2/data/services/api_service.dart';

part 'my_entries_repository.g.dart';

@riverpod
MyEntriesRepository myEntriesRepository(MyEntriesRepositoryRef ref) =>
    MyEntriesRepository();

class MyEntriesRepository {
  final apiService = ApiService();

  num isUserCount = 0;
  List categoryList = [];

  Future<DataResult<EntriesResponse>> getEntries() async {
    try {
      final entries = await apiService.getEntries();
      return DataResult(data: entries);
    } catch (e) {
      return DataResult(error: 'Failed to load entries: $e');
    }
  }

  void addCategory({required Entries data}) {
    // debugPrint("selected: ${data.category}");
    categoryList.add(data.category);
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
