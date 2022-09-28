// ignore_for_file: file_names

import 'package:booking_app/Core/Models/statusModel.dart';
import 'package:booking_app/Core/Models/userDataModel.dart';

class ChangePasswordModel {
  final StatusModel status;
  final UserDataModel data;

  ChangePasswordModel({
    required this.status,
    required this.data,
  });

  factory ChangePasswordModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ChangePasswordModel(
      status: StatusModel.fromJson(
        json['status'],
      ),
      data: UserDataModel.fromJson(json['data']),
    );
  }
}
