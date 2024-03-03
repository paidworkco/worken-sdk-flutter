import 'package:worken_sdk/features/transaction/domain/entities/result_entity.dart';

class ResultModel extends ResultEntity {
  const ResultModel({required super.status});

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        status: json['status'],
      );
}
