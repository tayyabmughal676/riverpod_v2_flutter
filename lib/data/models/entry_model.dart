// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:hive_flutter/hive_flutter.dart';

/// API : "AdoptAPet"
/// Description : "Resource to help get pets adopted"
/// Auth : "apiKey"
/// HTTPS : true
/// Cors : "yes"
/// Link : "https://www.adoptapet.com/public/apis/pet_list.html"
/// Category : "Animals"
///
///

part 'entry_model.g.dart';

@HiveType(typeId: 1)
class EntryModel {
  @HiveField(0)
  final String api;

  // @HiveField(1)
  // final List<String> photos;

  @HiveField(1)
  final String description;

  // @HiveField(3)
  // final DateTime date;

  @HiveField(2)
  final String auth;

  @HiveField(3)
  final bool https;

  @HiveField(4)
  final String cors;

  @HiveField(5)
  final String link;

  @HiveField(6)
  final String category;

  EntryModel({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  // Conversion from Entity to Model
  factory EntryModel.fromEntity(EntryEntity entity) => EntryModel(
        api: entity.api,
        description: entity.description,
        auth: entity.auth,
        https: entity.https,
        cors: entity.cors,
        link: entity.link,
        category: entity.category,
      );

  // Conversion from Model to Entity
  EntryEntity toEntity() => EntryEntity(
        api: api,
        description: description,
        auth: auth,
        https: https,
        cors: cors,
        link: link,
        category: category,
      );
}

class EntryEntity {
  final String api;
  final String description;
  final String auth;
  final bool https;
  final String cors;
  final String link;
  final String category;

  EntryEntity({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });
}
