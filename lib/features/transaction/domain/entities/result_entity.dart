import 'package:equatable/equatable.dart';

class ResultEntity extends Equatable {
  final String status;

  const ResultEntity({required this.status});

  @override
  List<Object> get props => [status];
}
