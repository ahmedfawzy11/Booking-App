import 'package:booking_app/Core/Models/dataModel.dart';
import 'package:booking_app/Core/Models/statusModel.dart';

class UpdateModel {
  final StatusModel status;
  final DataModel data;

  UpdateModel({
    required this.status,
    required this.data,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      status: StatusModel.fromJson(json['status']),
      data: DataModel.fromJson(json['data']),
    );
  }
}
