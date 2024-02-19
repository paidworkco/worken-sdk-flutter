import 'package:equatable/equatable.dart';

enum SecuresId { none }

class SecureItem extends Equatable {
  final SecuresId id;
  final String value;

  const SecureItem({required this.id, required this.value});

  @override
  List<Object> get props => [id, value];
}
