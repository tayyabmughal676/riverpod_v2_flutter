// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v2/data/models/EntriesResponse.dart';
import 'package:riverpod_v2/data/models/data_result.dart';
import 'package:riverpod_v2/data/repositories/my_entries_repository.dart';

part 'user_entries.g.dart';

@riverpod
class UserEntries extends _$UserEntries {
  num isUserCount = 0;
  List categoryList = [];

  ///
  Future<DataResult<EntriesResponse>> build() async {
    final returnEntry =
        await ref.watch(myEntriesRepositoryProvider).getEntries();
    debugPrint("returnEntry: $returnEntry");
    return returnEntry;
  }

  void addCategory({required Entries data}) {
    ref.watch(myEntriesRepositoryProvider).addCategory(data: data);

    // debugPrint("selected: ${data.category}");
    // categoryList.add(data.category);
    // debugPrint("selected: ${data.category}");
    // for (var value in categoryList) {
    //   debugPrint("value: $value");
    // }
  }

  void increment() {
    ref.watch(myEntriesRepositoryProvider).increment();
    // isUserCount++;
    // debugPrint("isUserCount:$isUserCount");
  }

  void decrement() {
    ref.watch(myEntriesRepositoryProvider).decrement();
    // if (isUserCount > 0) {
    //   isUserCount--;
    //   debugPrint("isUserCount:$isUserCount");
    // }
  }
}
