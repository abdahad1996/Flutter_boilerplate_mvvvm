
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freeexample.freezed.dart';
part 'freeexample.g.dart';

@freezed
abstract class Freeexample with _$Freeexample {
  factory Freeexample() = _Freeexample;
	
  factory Freeexample.fromJson(Map<String, dynamic> json) =>
			_$FreeexampleFromJson(json);
}
