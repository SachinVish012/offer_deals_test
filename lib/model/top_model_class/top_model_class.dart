class SeoSettings {
  final String seoTitle;
  final String seoDescription;
  final String webUrl;

  SeoSettings({
    required this.seoTitle,
    required this.seoDescription,
    required this.webUrl,
  });

  factory SeoSettings.fromJson(Map<String, dynamic> json) {
    return SeoSettings(
      seoTitle: json['seo_title'],
      seoDescription: json['seo_description'],
      webUrl: json['web_url'],
    );
  }
}

class Deal {
  final int id;
  final int commentsCount;
  final String createdAt;
  final int createdAtInMillis;
  final String imageMedium;
  final Store? store;

  Deal({
    required this.id,
    required this.commentsCount,
    required this.createdAt,
    required this.createdAtInMillis,
    required this.imageMedium,
    required this.store,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'],
      commentsCount: json['comments_count'],
      createdAt: json['created_at'],
      createdAtInMillis: json['created_at_in_millis'],
      imageMedium: json['image_medium'],
      store: json['store'] != null ? Store.fromJson(json['store']) : null,
    );
  }
}

class Store {
  final String name;

  Store({required this.name});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
    );
  }
}

class ApiResponse {
  final SeoSettings seoSettings;
  final List<Deal> deals;

  ApiResponse({required this.seoSettings, required this.deals});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      seoSettings: SeoSettings.fromJson(json['seo_settings']),
      deals: List<Deal>.from(json['deals'].map((deal) => Deal.fromJson(deal))),
    );
  }
}
