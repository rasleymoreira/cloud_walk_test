import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_res_dto.freezed.dart';
part 'location_res_dto.g.dart';

@freezed
class LocationResDTO with _$LocationResDTO {
  const factory LocationResDTO({
    String? status,
    String? country,
    String? countryCode,
    String? region,
    String? regionName,
    String? city,
    String? zip,
    double? lat,
    double? lon,
    String? timezone,
    String? isp,
    String? org,
    String? as,
    String? query,
  }) = _LocationResDTO;

  factory LocationResDTO.fromJson(Map<String, dynamic> json) => _$LocationResDTOFromJson(json);
}
