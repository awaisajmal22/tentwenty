// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchResModelImpl _$$WatchResModelImplFromJson(Map<String, dynamic> json) =>
    _$WatchResModelImpl(
      dates: json['dates'] as Map<String, dynamic>?,
      page: (json['page'] as num?)?.toInt() ?? -1,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      total_pages: (json['total_pages'] as num?)?.toInt() ?? -1,
      total_results: (json['total_results'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$WatchResModelImplToJson(_$WatchResModelImpl instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
