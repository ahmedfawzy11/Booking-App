import 'package:booking_app/Core/Models/dataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class RegisterModel {
  final StatusModel status;
  final DataModel data;

  RegisterModel({
    required this.status,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: StatusModel.fromJson(json['status']),
      data: DataModel.fromJson(json['data']),
    );
  }
}
