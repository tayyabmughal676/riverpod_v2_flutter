// Created by Tayyab Mughal on 29/06/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v2/models/UserModel.dart';

part 'user_auth_repository.g.dart';

@riverpod
UserAuthRepository userAuthRepository(UserAuthRepositoryRef ref) =>
    UserAuthRepository();

class UserAuthRepository {
  Future<UserModel> getUsers() async {
    final dio = Dio();
    final response = await dio.get("https://reqres.in/api/users?page=2");
    debugPrint("response: $response");
    final responseJson = response.data;
    return UserModel.fromJson(responseJson);
  }

  Future<void> isUserClicked() async {
    debugPrint("isUserClicked");
  }
}
