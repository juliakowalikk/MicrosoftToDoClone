import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String input;

  Task({required this.input});
// dodac id
  @override
  List<Object> get props => [input];
}
