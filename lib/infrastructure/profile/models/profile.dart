import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final int curatorId;
  final String phoneNumber;
  final String firstname;
  final String lastname;
  final int age;
  final int height;
  final String gender;
  final String status;
  final bool haveChild;
  final String country;
  final String city;
  final List profilePhotos; // ??
  final List curatorPhotos; // ??
  final String profileInfo;
  final String createdAt;
  final String savedAt;
  final bool isActive;
  final bool draft;
  final bool isHidden;
  final bool showInfo;

  const Profile(
    this.id,
    this.curatorId,
    this.phoneNumber,
    this.firstname,
    this.lastname,
    this.age,
    this.height,
    this.gender,
    this.status,
    this.haveChild,
    this.country,
    this.city,
    this.profilePhotos,
    this.curatorPhotos,
    this.profileInfo,
    this.createdAt,
    this.savedAt,
    this.isActive,
    this.draft,
    this.isHidden,
    this.showInfo,
  );

  @override
  List<Object?> get props => [
        firstname,
        age,
        profileInfo,
        showInfo,
        isHidden,
      ];
}
