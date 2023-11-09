// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationReqDTOImpl _$$LocationReqDTOImplFromJson(Map<String, dynamic> json) =>
    _$LocationReqDTOImpl(
      query: json['query'] as String? ?? "",
      forceReload: json['forceReload'] as bool? ?? false,
    );

Map<String, dynamic> _$$LocationReqDTOImplToJson(
        _$LocationReqDTOImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'forceReload': instance.forceReload,
    };
