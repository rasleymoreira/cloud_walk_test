// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationReqDTO _$LocationReqDTOFromJson(Map<String, dynamic> json) {
  return _LocationReqDTO.fromJson(json);
}

/// @nodoc
mixin _$LocationReqDTO {
  String get query => throw _privateConstructorUsedError;
  bool get forceReload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationReqDTOCopyWith<LocationReqDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationReqDTOCopyWith<$Res> {
  factory $LocationReqDTOCopyWith(
          LocationReqDTO value, $Res Function(LocationReqDTO) then) =
      _$LocationReqDTOCopyWithImpl<$Res, LocationReqDTO>;
  @useResult
  $Res call({String query, bool forceReload});
}

/// @nodoc
class _$LocationReqDTOCopyWithImpl<$Res, $Val extends LocationReqDTO>
    implements $LocationReqDTOCopyWith<$Res> {
  _$LocationReqDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? forceReload = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      forceReload: null == forceReload
          ? _value.forceReload
          : forceReload // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationReqDTOImplCopyWith<$Res>
    implements $LocationReqDTOCopyWith<$Res> {
  factory _$$LocationReqDTOImplCopyWith(_$LocationReqDTOImpl value,
          $Res Function(_$LocationReqDTOImpl) then) =
      __$$LocationReqDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, bool forceReload});
}

/// @nodoc
class __$$LocationReqDTOImplCopyWithImpl<$Res>
    extends _$LocationReqDTOCopyWithImpl<$Res, _$LocationReqDTOImpl>
    implements _$$LocationReqDTOImplCopyWith<$Res> {
  __$$LocationReqDTOImplCopyWithImpl(
      _$LocationReqDTOImpl _value, $Res Function(_$LocationReqDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? forceReload = null,
  }) {
    return _then(_$LocationReqDTOImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      forceReload: null == forceReload
          ? _value.forceReload
          : forceReload // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationReqDTOImpl implements _LocationReqDTO {
  const _$LocationReqDTOImpl({this.query = "", this.forceReload = false});

  factory _$LocationReqDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationReqDTOImplFromJson(json);

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool forceReload;

  @override
  String toString() {
    return 'LocationReqDTO(query: $query, forceReload: $forceReload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationReqDTOImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.forceReload, forceReload) ||
                other.forceReload == forceReload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, forceReload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationReqDTOImplCopyWith<_$LocationReqDTOImpl> get copyWith =>
      __$$LocationReqDTOImplCopyWithImpl<_$LocationReqDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationReqDTOImplToJson(
      this,
    );
  }
}

abstract class _LocationReqDTO implements LocationReqDTO {
  const factory _LocationReqDTO({final String query, final bool forceReload}) =
      _$LocationReqDTOImpl;

  factory _LocationReqDTO.fromJson(Map<String, dynamic> json) =
      _$LocationReqDTOImpl.fromJson;

  @override
  String get query;
  @override
  bool get forceReload;
  @override
  @JsonKey(ignore: true)
  _$$LocationReqDTOImplCopyWith<_$LocationReqDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
