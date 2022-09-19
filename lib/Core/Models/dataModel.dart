class DataModel {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String apiToken;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic googleId;
  final dynamic provider;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.apiToken,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.googleId,
    required this.provider,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      apiToken: json["api_token"],
      image: json["image"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      googleId: json["google_id"],
      provider: json["provider"],
    );
  }
}
