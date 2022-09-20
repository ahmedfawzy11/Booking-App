import 'package:booking_app/Core/Models/userDataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class ProfileModel {
  final StatusModel status;
  final UserDataModel data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserDataModel.fromJson(json['data']),
    );
  }
}
