import 'package:booking_app/Core/Models/dataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class ChangePasswordModel {
  final StatusModel status;
  final DataModel data;

  ChangePasswordModel({
    required this.status,
    required this.data,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: StatusModel.fromJson(json['status']),
      data: DataModel.fromJson(json['data']),
    );
  }
}
