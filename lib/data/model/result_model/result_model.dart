
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result_model.freezed.dart';
part 'result_model.g.dart';
@Freezed()
class Results with _$Results{
  factory Results({
 @Default(false)   bool? adult,
   @Default('')  String? backdrop_path,
   @Default([])  List<int>? genre_ids,
  @Default(-1)   int? id,
  @Default('') String? original_language,
  @Default('')   String? original_title,
   @Default('')  String? overview,
  @Default(-1.0)   double? popularity,
 @Default('')    String? poster_path,
   @Default('')  String? release_date,
   @Default('')  String? title,
  @Default(false)   bool? video,
   @Default(-1.0)  double? vote_average,
    @Default(-1) int? vote_count,}) = _Results;
factory Results.fromJson(Map<String,dynamic> json)=> _$ResultsFromJson(json);
}

