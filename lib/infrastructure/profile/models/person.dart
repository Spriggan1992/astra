import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final int age;
  final String city;
  final String info;

  const Person({
    required this.name,
    required this.age,
    required this.city,
    required this.info,
});

  @override
  List<Object?> get props => [
    name,
    age,
    city,
    info,
  ];
}