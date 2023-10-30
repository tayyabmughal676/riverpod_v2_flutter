// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

class DataResult<T> {
  final T? data;
  final int? statusCode;
  final String? error;

  DataResult({this.data, this.error, this.statusCode});
}
