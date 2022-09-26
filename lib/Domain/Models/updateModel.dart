// ignore_for_file: file_names

import 'package:booking_app/Core/Models/statusModel.dart';
import 'package:booking_app/Core/Models/userDataModel.dart';

class UpdateModel {
  final StatusModel status;
  final UserDataModel data;

  UpdateModel({
    required this.status,
    required this.data,
  });

  factory UpdateModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateModel(
      status: StatusModel.fromJson(
        json['status'],
      ),
      data: UserDataModel.fromJson(
        json['data'],
      ),
    );
  }
}
