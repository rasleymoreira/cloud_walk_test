import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_req_dto.freezed.dart';
part 'location_req_dto.g.dart';

@freezed
class LocationReqDTO with _$LocationReqDTO {
  const factory LocationReqDTO({
    @Default("") String query,
    @Default(false) bool forceReload,
  }) = _LocationReqDTO;

  factory LocationReqDTO.fromJson(Map<String, dynamic> json) => _$LocationReqDTOFromJson(json);
}
