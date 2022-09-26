// ignore_for_file: file_names

import 'package:booking_app/Core/Models/statusModel.dart';
import 'package:booking_app/Core/Models/userDataModel.dart';

class RegisterModel {
  final StatusModel status;
  final UserDataModel data;

  RegisterModel({
    required this.status,
    required this.data,
  });

  factory RegisterModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisterModel(
      status: StatusModel.fromJson(
        json['status'],
      ),
      data: UserDataModel.fromJson(
        json['data'],
      ),
    );
  }
}
