
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dates_model.freezed.dart';
part 'dates_model.g.dart';
@Freezed()
class Dates with _$Dates{
  factory Dates({
    @Default('') String? maximum,
    @Default('') String? minimum
  })= _Dates;
  factory Dates.fromJson(Map<String, dynamic> json)=> _$DatesFromJson(json);
}