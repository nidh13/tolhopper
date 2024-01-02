class CountryMapResponse {
  CountryMapResponse({
    required this.data,
  });

  final List<CountryMapModel> data;

  factory CountryMapResponse.fromJson(Map<String, dynamic> json) {
    return CountryMapResponse(
      data: json["data"] == null
          ? []
          : List<CountryMapModel>.from(
              json["data"]!.map((x) => CountryMapModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class CountryMapModel {
  CountryMapModel({
    required this.id,
    required this.attributes,
  });

  final int? id;
  final Attributes? attributes;

  factory CountryMapModel.fromJson(Map<String, dynamic> json) {
    return CountryMapModel(
      id: json["id"],
      attributes: json["attributes"] == null
          ? null
          : Attributes.fromJson(json["attributes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? name;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      name: json["name"],
      alternativeText: json["alternativeText"],
      caption: json["caption"],
      width: json["width"],
      height: json["height"],
      formats:
          json["formats"] == null ? null : Formats.fromJson(json["formats"]),
      hash: json["hash"],
      ext: json["ext"],
      mime: json["mime"],
      size: json["size"],
      url: json["url"],
      previewUrl: json["previewUrl"],
      provider: json["provider"],
      providerMetadata: json["provider_metadata"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Formats {
  Formats({
    required this.thumbnail,
    required this.large,
    required this.medium,
    required this.small,
  });

  final Large? thumbnail;
  final Large? large;
  final Large? medium;
  final Large? small;

  factory Formats.fromJson(Map<String, dynamic> json) {
    return Formats(
      thumbnail:
          json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
      large: json["large"] == null ? null : Large.fromJson(json["large"]),
      medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
      small: json["small"] == null ? null : Large.fromJson(json["small"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail?.toJson(),
        "large": large?.toJson(),
        "medium": medium?.toJson(),
        "small": small?.toJson(),
      };
}

class Large {
  Large({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });

  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final dynamic path;
  final int? width;
  final int? height;
  final double? size;
  final String? url;

  factory Large.fromJson(Map<String, dynamic> json) {
    return Large(
      name: json["name"],
      hash: json["hash"],
      ext: json["ext"],
      mime: json["mime"],
      path: json["path"],
      width: json["width"],
      height: json["height"],
      size: json["size"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}
