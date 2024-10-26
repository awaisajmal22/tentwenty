// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsImpl _$$ResultsImplFromJson(Map<String, dynamic> json) =>
    _$ResultsImpl(
      adult: json['adult'] as bool? ?? false,
      backdrop_path: json['backdrop_path'] as String? ?? '',
      genre_ids: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      id: (json['id'] as num?)?.toInt() ?? -1,
      original_language: json['original_language'] as String? ?? '',
      original_title: json['original_title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? -1.0,
      poster_path: json['poster_path'] as String? ?? '',
      release_date: json['release_date'] as String? ?? '',
      title: json['title'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      vote_average: (json['vote_average'] as num?)?.toDouble() ?? -1.0,
      vote_count: (json['vote_count'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$ResultsImplToJson(_$ResultsImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
