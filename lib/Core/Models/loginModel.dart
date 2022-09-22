import 'package:booking_app/Core/Models/userDataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class LoginModel {
  final StatusModel status;
  final UserDataModel data;

  LoginModel({
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: StatusModel.fromJson(json['status']),
      data: UserDataModel.fromJson(json['data']),
    );
  }
}
