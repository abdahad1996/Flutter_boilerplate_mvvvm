
import 'package:json_annotation/json_annotation.dart';
part 'person_model.g.dart';
@JsonSerializable(nullable: false)
class PersonModel{
 final String firstName;
  final String lastName;
  final DateTime dateOfBirth;

  PersonModel(this.firstName, this.lastName, this.dateOfBirth);
 
 factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);
  Map<String,dynamic> toJson() => _$PersonModelToJson(this);
 }