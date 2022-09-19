import 'package:booking_app/Core/Models/dataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class ProfileModel {
  final StatusModel status;
  final DataModel data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: DataModel.fromJson(json['data']),
    );
  }
}
