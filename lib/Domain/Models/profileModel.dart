// ignore_for_file: file_names

import 'package:booking_app/Domain/Models/statusModel.dart';
import 'package:booking_app/Domain/Models/userDataModel.dart';

class ProfileModel {
  final StatusModel status;
  final UserDataModel data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProfileModel(
      status: StatusModel.fromJson(
        json['status'],
      ),
      data: UserDataModel.fromJson(
        json['data'],
      ),
    );
  }
}
