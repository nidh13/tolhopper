import 'dart:convert';

NewsResponse newsModelFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

class NewsResponse {
  final List<NewsModel> data;
  final Meta? meta;

  NewsResponse({
    required this.data,
    this.meta,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        data: json["data"] == null
            ? []
            : List<NewsModel>.from(
                json["data"]!.map((x) => NewsModel.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );
}

class NewsModel {
  final int id;
  final PurpleAttributes? attributes;

  NewsModel({
    required this.id,
    this.attributes,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromJson(json["attributes"]),
      );
}

class PurpleAttributes {
  final String? title;
  final String? description;
  final String? shortDescription;
  final String? handle;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? locale;
  final Image? image;
  final CategorieBlog? categorieBlog;
  final CommentBlogs? commentBlogs;
  final MetaTags? metaTags;
  final Localizations? localizations;

  PurpleAttributes({
    this.title,
    this.description,
    this.shortDescription,
    this.handle,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    this.image,
    this.categorieBlog,
    this.commentBlogs,
    this.metaTags,
    this.localizations,
  });

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        title: json["title"],
        description: json["description"],
        shortDescription: json["short_description"],
        handle: json["handle"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        categorieBlog: json["categorie_blog"] == null
            ? null
            : CategorieBlog.fromJson(json["categorie_blog"]),
        commentBlogs: json["comment_blogs"] == null
            ? null
            : CommentBlogs.fromJson(json["comment_blogs"]),
        metaTags: json["Meta_tags"] == null
            ? null
            : MetaTags.fromJson(json["Meta_tags"]),
        localizations: json["localizations"] == null
            ? null
            : Localizations.fromJson(json["localizations"]),
      );
}

class CategorieBlog {
  final CategorieBlogData? data;

  CategorieBlog({
    this.data,
  });

  factory CategorieBlog.fromJson(Map<String, dynamic> json) => CategorieBlog(
        data: json["data"] == null
            ? null
            : CategorieBlogData.fromJson(json["data"]),
      );
}

class CategorieBlogData {
  final int? id;
  final FluffyAttributes? attributes;

  CategorieBlogData({
    this.id,
    this.attributes,
  });

  factory CategorieBlogData.fromJson(Map<String, dynamic> json) =>
      CategorieBlogData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromJson(json["attributes"]),
      );
}

class FluffyAttributes {
  final String? title;
  final String? handle;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? locale;

  FluffyAttributes({
    this.title,
    this.handle,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
  });

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        title: json["title"],
        handle: json["handle"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
      );
}

class CommentBlogs {
  final List<dynamic>? data;

  CommentBlogs({
    this.data,
  });

  factory CommentBlogs.fromJson(Map<String, dynamic> json) => CommentBlogs(
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );
}

class Image {
  final ImageData? data;

  Image({
    this.data,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: json["data"] == null ? null : ImageData.fromJson(json["data"]),
      );
}

class ImageData {
  final int? id;
  final TentacledAttributes? attributes;

  ImageData({
    this.id,
    this.attributes,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : TentacledAttributes.fromJson(json["attributes"]),
      );
}

class TentacledAttributes {
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

  TentacledAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) =>
      TentacledAttributes(
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
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );
}

class Formats {
  final Medium? thumbnail;
  final Medium? small;
  final Medium? medium;

  Formats({
    this.thumbnail,
    this.small,
    this.medium,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Medium.fromJson(json["thumbnail"]),
        small: json["small"] == null ? null : Medium.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Medium.fromJson(json["medium"]),
      );
}

class Medium {
  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final dynamic path;
  final int? width;
  final int? height;
  final double? size;
  final String? url;

  Medium({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.path,
    this.width,
    this.height,
    this.size,
    this.url,
  });

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );
}

class Localizations {
  final List<LocalizationsDatum>? data;

  Localizations({
    this.data,
  });

  factory Localizations.fromJson(Map<String, dynamic> json) => Localizations(
        data: json["data"] == null
            ? []
            : List<LocalizationsDatum>.from(
                json["data"]!.map((x) => LocalizationsDatum.fromJson(x))),
      );
}

class LocalizationsDatum {
  final int? id;
  final StickyAttributes? attributes;

  LocalizationsDatum({
    this.id,
    this.attributes,
  });

  factory LocalizationsDatum.fromJson(Map<String, dynamic> json) =>
      LocalizationsDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : StickyAttributes.fromJson(json["attributes"]),
      );
}

class StickyAttributes {
  final String? title;
  final String? description;
  final String? shortDescription;
  final String? handle;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? locale;

  StickyAttributes({
    this.title,
    this.description,
    this.shortDescription,
    this.handle,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
  });

  factory StickyAttributes.fromJson(Map<String, dynamic> json) =>
      StickyAttributes(
        title: json["title"],
        description: json["description"],
        shortDescription: json["short_description"],
        handle: json["handle"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
      );
}

class MetaTags {
  final int? id;
  final String? metaTitle;
  final String? metaDescription;
  final dynamic metaKeys;

  MetaTags({
    this.id,
    this.metaTitle,
    this.metaDescription,
    this.metaKeys,
  });

  factory MetaTags.fromJson(Map<String, dynamic> json) => MetaTags(
        id: json["id"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeys: json["meta_keys"],
      );
}

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );
}
