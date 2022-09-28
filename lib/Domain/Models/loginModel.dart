// ignore_for_file: file_names

import 'package:booking_app/Domain/Models/statusModel.dart';
import 'package:booking_app/Domain/Models/userDataModel.dart';

class LoginModel {
  final StatusModel status;
  final UserDataModel data;

  LoginModel({
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LoginModel(
      status: StatusModel.fromJson(
        json['status'],
      ),
      data: UserDataModel.fromJson(
        json['data'],
      ),
    );
  }
}
