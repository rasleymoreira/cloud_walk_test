import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDTO with _$LocationDTO {
  const factory LocationDTO({
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
  }) = _LocationDTO;

  factory LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);
}
