// ignore_for_file: file_names

class StatusModel {
  final String type;
  final String titleAr;
  final String titleEn;

  StatusModel({
    required this.type,
    required this.titleAr,
    required this.titleEn,
  });

  factory StatusModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return StatusModel(
      type: json['type'] ?? '0',
      titleAr: json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      titleEn: json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
    );
  }
}
