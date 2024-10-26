// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchResModel _$WatchResModelFromJson(Map<String, dynamic> json) {
  return _WatchResModel.fromJson(json);
}

/// @nodoc
mixin _$WatchResModel {
  @Freezed()
  Map<String, dynamic>? get dates => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get results => throw _privateConstructorUsedError;
  int? get total_pages => throw _privateConstructorUsedError;
  int? get total_results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchResModelCopyWith<WatchResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchResModelCopyWith<$Res> {
  factory $WatchResModelCopyWith(
          WatchResModel value, $Res Function(WatchResModel) then) =
      _$WatchResModelCopyWithImpl<$Res, WatchResModel>;
  @useResult
  $Res call(
      {@Freezed() Map<String, dynamic>? dates,
      int? page,
      List<Map<String, dynamic>>? results,
      int? total_pages,
      int? total_results});
}

/// @nodoc
class _$WatchResModelCopyWithImpl<$Res, $Val extends WatchResModel>
    implements $WatchResModelCopyWith<$Res> {
  _$WatchResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = freezed,
    Object? page = freezed,
    Object? results = freezed,
    Object? total_pages = freezed,
    Object? total_results = freezed,
  }) {
    return _then(_value.copyWith(
      dates: freezed == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      total_pages: freezed == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int?,
      total_results: freezed == total_results
          ? _value.total_results
          : total_results // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchResModelImplCopyWith<$Res>
    implements $WatchResModelCopyWith<$Res> {
  factory _$$WatchResModelImplCopyWith(
          _$WatchResModelImpl value, $Res Function(_$WatchResModelImpl) then) =
      __$$WatchResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Freezed() Map<String, dynamic>? dates,
      int? page,
      List<Map<String, dynamic>>? results,
      int? total_pages,
      int? total_results});
}

/// @nodoc
class __$$WatchResModelImplCopyWithImpl<$Res>
    extends _$WatchResModelCopyWithImpl<$Res, _$WatchResModelImpl>
    implements _$$WatchResModelImplCopyWith<$Res> {
  __$$WatchResModelImplCopyWithImpl(
      _$WatchResModelImpl _value, $Res Function(_$WatchResModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = freezed,
    Object? page = freezed,
    Object? results = freezed,
    Object? total_pages = freezed,
    Object? total_results = freezed,
  }) {
    return _then(_$WatchResModelImpl(
      dates: freezed == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      total_pages: freezed == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int?,
      total_results: freezed == total_results
          ? _value.total_results
          : total_results // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchResModelImpl implements _WatchResModel {
  _$WatchResModelImpl(
      {@Freezed() final Map<String, dynamic>? dates,
      this.page = -1,
      final List<Map<String, dynamic>>? results = const [],
      this.total_pages = -1,
      this.total_results = -1})
      : _dates = dates,
        _results = results;

  factory _$WatchResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchResModelImplFromJson(json);

  final Map<String, dynamic>? _dates;
  @override
  @Freezed()
  Map<String, dynamic>? get dates {
    final value = _dates;
    if (value == null) return null;
    if (_dates is EqualUnmodifiableMapView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int? page;
  final List<Map<String, dynamic>>? _results;
  @override
  @JsonKey()
  List<Map<String, dynamic>>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? total_pages;
  @override
  @JsonKey()
  final int? total_results;

  @override
  String toString() {
    return 'WatchResModel(dates: $dates, page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchResModelImpl &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.total_pages, total_pages) ||
                other.total_pages == total_pages) &&
            (identical(other.total_results, total_results) ||
                other.total_results == total_results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dates),
      page,
      const DeepCollectionEquality().hash(_results),
      total_pages,
      total_results);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchResModelImplCopyWith<_$WatchResModelImpl> get copyWith =>
      __$$WatchResModelImplCopyWithImpl<_$WatchResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchResModelImplToJson(
      this,
    );
  }
}

abstract class _WatchResModel implements WatchResModel {
  factory _WatchResModel(
      {@Freezed() final Map<String, dynamic>? dates,
      final int? page,
      final List<Map<String, dynamic>>? results,
      final int? total_pages,
      final int? total_results}) = _$WatchResModelImpl;

  factory _WatchResModel.fromJson(Map<String, dynamic> json) =
      _$WatchResModelImpl.fromJson;

  @override
  @Freezed()
  Map<String, dynamic>? get dates;
  @override
  int? get page;
  @override
  List<Map<String, dynamic>>? get results;
  @override
  int? get total_pages;
  @override
  int? get total_results;
  @override
  @JsonKey(ignore: true)
  _$$WatchResModelImplCopyWith<_$WatchResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
