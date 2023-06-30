import 'package:json_annotation/json_annotation.dart';
import '../Api/data_parser_factory.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel implements DataParser<UserModel> {
  final int? id;
  final String? name;
  final String? username;
  final String? email;

  const UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  static DataParser<UserModel> get parser => const UserModel();
}
