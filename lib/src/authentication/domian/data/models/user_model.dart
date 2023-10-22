import 'dart:convert';

import 'package:flutter_toy/src/authentication/domian/entities/user.dart';
import 'package:flutter_toy/src/core/utils/typedef.dart';

class UserModel extends User {
  const UserModel({
    required super.avater,
    required super.id,
    required super.createdAt,
    required super.name,
  });

  const UserModel.empty() : this(
    id: '1',
    createdAt: '_empty.createdAt',
    name: '_empty.name',
    avater: '_empty.avatar',
  );

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map) :
    this(
      avater: map['avater'] as String,
        id: map['id'] as String,
        createdAt: map['createdAt'] as String,
        name : map['name'] as String,
    );

  UserModel copyWith({
    String? avatar,
    String? id,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
        avater: avater ?? this.avater,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
    );
  }

  DataMap toMap() =>{
    'id' : id,
    'avator' : avater,
    'createdAt' : createdAt,
    'name' : name,
  };

  String toJson() => jsonEncode(toMap());

}
