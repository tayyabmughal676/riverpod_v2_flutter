// Created by Tayyab Mughal on 29/06/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_v2/models/UserModel.dart';

import '../repositories/user_auth_repository.dart';

part 'user_auth_provider.g.dart';

@riverpod
class UserAuth extends _$UserAuth {
  num value = 0;

  @override
  Future<UserModel> build() async {
    final returnUsers = await ref.watch(userAuthRepositoryProvider).getUsers();
    return returnUsers;
  }

  Future<void> userClick() async {
    await ref.read(userAuthRepositoryProvider).isUserClicked();
  }

}

// @riverpod
// Future<UserModel> fetchUsers(FetchUsersRef ref) async {
//   final dio = Dio();
//   final response = await dio.get("https://reqres.in/api/users?page=2");
//   debugPrint("response: $response");
//   final responseJson = response.data;
//   return UserModel.fromJson(responseJson);
// }
