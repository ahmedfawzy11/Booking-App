import 'package:booking_app/Core/Models/userDataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class RegisterModel {
  final StatusModel status;
  final UserDataModel data;

  RegisterModel({
    required this.status,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: StatusModel.fromJson(json['status']),
      data: UserDataModel.fromJson(json['data']),
    );
  }
}
