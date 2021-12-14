import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final int age;
  final String info;
  final bool isFullInfo;
  final bool isHidden;
  // final Person curator;

  const Profile({
    required this.name,
    required this.age,
    required this.info,
    required this.isFullInfo,
    required this.isHidden,
    // required this.curator,
  });

  @override
  List<Object?> get props => [
        name,
        age,
        info,
        isFullInfo,
        isHidden,
        // curator,
      ];
}
