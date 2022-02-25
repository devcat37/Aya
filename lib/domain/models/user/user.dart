// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends _UserBase with _$User {
  User({
    required String name,
    required String surname,
    String? lastName,
  }) : super(
          name: name,
          surname: surname,
          lastName: lastName,
        );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

abstract class _UserBase with Store {
  _UserBase({
    required this.name,
    required this.surname,
    this.lastName,
  });

  final String name;
  final String surname;
  final String? lastName;

  String get fullName => '$name $surname';
}
