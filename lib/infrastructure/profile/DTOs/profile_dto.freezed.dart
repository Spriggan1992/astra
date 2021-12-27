// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) {
  return _ProfileDTO.fromJson(json);
}

/// @nodoc
class _$ProfileDTOTearOff {
  const _$ProfileDTOTearOff();

  _ProfileDTO call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'curator_id') required int curatorId,
      @JsonKey(name: 'phone_number') required String phoneNumber,
      @JsonKey(name: 'firstname') required String firstname,
      @JsonKey(name: 'lastname') required String lastname,
      @JsonKey(name: 'age') required int age,
      @JsonKey(name: 'height') required int height,
      @JsonKey(name: 'gender') required String gender,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'have_child') required bool haveChild,
      @JsonKey(name: 'country') required String country,
      @JsonKey(name: 'city') required String city,
      @JsonKey(name: 'profile_photos') required List<ImageDTO> profilePhotos,
      @JsonKey(name: 'curator_photos') required List<ImageDTO> curatorPhotos,
      @JsonKey(name: 'profile_info') required String profileInfo,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'saved_at') required String savedAt,
      @JsonKey(name: 'is_active') required bool isActive,
      @JsonKey(name: 'draft') required bool draft,
      @JsonKey(name: 'is_hidden') required bool isHidden,
      @JsonKey(name: 'show_info') required bool showInfo}) {
    return _ProfileDTO(
      id: id,
      curatorId: curatorId,
      phoneNumber: phoneNumber,
      firstname: firstname,
      lastname: lastname,
      age: age,
      height: height,
      gender: gender,
      status: status,
      haveChild: haveChild,
      country: country,
      city: city,
      profilePhotos: profilePhotos,
      curatorPhotos: curatorPhotos,
      profileInfo: profileInfo,
      createdAt: createdAt,
      savedAt: savedAt,
      isActive: isActive,
      draft: draft,
      isHidden: isHidden,
      showInfo: showInfo,
    );
  }

  ProfileDTO fromJson(Map<String, Object?> json) {
    return ProfileDTO.fromJson(json);
  }
}

/// @nodoc
const $ProfileDTO = _$ProfileDTOTearOff();

/// @nodoc
mixin _$ProfileDTO {
  /// User identifier.
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  /// Curator id.
  @JsonKey(name: 'curator_id')
  int get curatorId =>
      throw _privateConstructorUsedError; // / User phone number.
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;

  /// User firstname.
  @JsonKey(name: 'firstname')
  String get firstname => throw _privateConstructorUsedError;

  /// User lastname.
  @JsonKey(name: 'lastname')
  String get lastname => throw _privateConstructorUsedError;

  /// User age.
  @JsonKey(name: 'age')
  int get age => throw _privateConstructorUsedError;

  /// User height.
  @JsonKey(name: 'height')
  int get height => throw _privateConstructorUsedError;

  /// User gender.
  @JsonKey(name: 'gender')
  String get gender => throw _privateConstructorUsedError;

  /// User status.
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// A flag responsible to status that user have a child.
  @JsonKey(name: 'have_child')
  bool get haveChild => throw _privateConstructorUsedError;

  /// Users country.
  @JsonKey(name: 'country')
  String get country => throw _privateConstructorUsedError;

  /// Users city.
  @JsonKey(name: 'city')
  String get city => throw _privateConstructorUsedError;

  /// Users profile photos.
  @JsonKey(name: 'profile_photos')
  List<ImageDTO> get profilePhotos => throw _privateConstructorUsedError;

  /// Curators photos.
  @JsonKey(name: 'curator_photos')
  List<ImageDTO> get curatorPhotos => throw _privateConstructorUsedError;

  /// Users profileInfo.
  @JsonKey(name: 'profile_info')
  String get profileInfo => throw _privateConstructorUsedError;

  /// Users created account date.
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Users saved account date.
  @JsonKey(name: 'saved_at')
  String get savedAt => throw _privateConstructorUsedError;

  /// A flag resposible for status of relationship in active.
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;

  /// ?
  @JsonKey(name: 'draft')
  bool get draft => throw _privateConstructorUsedError;

  /// A flag responsible for hidden status account.
  @JsonKey(name: 'is_hidden')
  bool get isHidden => throw _privateConstructorUsedError;

  /// A flag responsible for hidden account info account.
  @JsonKey(name: 'show_info')
  bool get showInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDTOCopyWith<ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDTOCopyWith<$Res> {
  factory $ProfileDTOCopyWith(
          ProfileDTO value, $Res Function(ProfileDTO) then) =
      _$ProfileDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'curator_id') int curatorId,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'firstname') String firstname,
      @JsonKey(name: 'lastname') String lastname,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'have_child') bool haveChild,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'profile_photos') List<ImageDTO> profilePhotos,
      @JsonKey(name: 'curator_photos') List<ImageDTO> curatorPhotos,
      @JsonKey(name: 'profile_info') String profileInfo,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'saved_at') String savedAt,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'draft') bool draft,
      @JsonKey(name: 'is_hidden') bool isHidden,
      @JsonKey(name: 'show_info') bool showInfo});
}

/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res> implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._value, this._then);

  final ProfileDTO _value;
  // ignore: unused_field
  final $Res Function(ProfileDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? curatorId = freezed,
    Object? phoneNumber = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? haveChild = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? profilePhotos = freezed,
    Object? curatorPhotos = freezed,
    Object? profileInfo = freezed,
    Object? createdAt = freezed,
    Object? savedAt = freezed,
    Object? isActive = freezed,
    Object? draft = freezed,
    Object? isHidden = freezed,
    Object? showInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      curatorId: curatorId == freezed
          ? _value.curatorId
          : curatorId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      haveChild: haveChild == freezed
          ? _value.haveChild
          : haveChild // ignore: cast_nullable_to_non_nullable
              as bool,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotos: profilePhotos == freezed
          ? _value.profilePhotos
          : profilePhotos // ignore: cast_nullable_to_non_nullable
              as List<ImageDTO>,
      curatorPhotos: curatorPhotos == freezed
          ? _value.curatorPhotos
          : curatorPhotos // ignore: cast_nullable_to_non_nullable
              as List<ImageDTO>,
      profileInfo: profileInfo == freezed
          ? _value.profileInfo
          : profileInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      savedAt: savedAt == freezed
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      draft: draft == freezed
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      showInfo: showInfo == freezed
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProfileDTOCopyWith<$Res> implements $ProfileDTOCopyWith<$Res> {
  factory _$ProfileDTOCopyWith(
          _ProfileDTO value, $Res Function(_ProfileDTO) then) =
      __$ProfileDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'curator_id') int curatorId,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'firstname') String firstname,
      @JsonKey(name: 'lastname') String lastname,
      @JsonKey(name: 'age') int age,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'have_child') bool haveChild,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'profile_photos') List<ImageDTO> profilePhotos,
      @JsonKey(name: 'curator_photos') List<ImageDTO> curatorPhotos,
      @JsonKey(name: 'profile_info') String profileInfo,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'saved_at') String savedAt,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'draft') bool draft,
      @JsonKey(name: 'is_hidden') bool isHidden,
      @JsonKey(name: 'show_info') bool showInfo});
}

/// @nodoc
class __$ProfileDTOCopyWithImpl<$Res> extends _$ProfileDTOCopyWithImpl<$Res>
    implements _$ProfileDTOCopyWith<$Res> {
  __$ProfileDTOCopyWithImpl(
      _ProfileDTO _value, $Res Function(_ProfileDTO) _then)
      : super(_value, (v) => _then(v as _ProfileDTO));

  @override
  _ProfileDTO get _value => super._value as _ProfileDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? curatorId = freezed,
    Object? phoneNumber = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? haveChild = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? profilePhotos = freezed,
    Object? curatorPhotos = freezed,
    Object? profileInfo = freezed,
    Object? createdAt = freezed,
    Object? savedAt = freezed,
    Object? isActive = freezed,
    Object? draft = freezed,
    Object? isHidden = freezed,
    Object? showInfo = freezed,
  }) {
    return _then(_ProfileDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      curatorId: curatorId == freezed
          ? _value.curatorId
          : curatorId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      haveChild: haveChild == freezed
          ? _value.haveChild
          : haveChild // ignore: cast_nullable_to_non_nullable
              as bool,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotos: profilePhotos == freezed
          ? _value.profilePhotos
          : profilePhotos // ignore: cast_nullable_to_non_nullable
              as List<ImageDTO>,
      curatorPhotos: curatorPhotos == freezed
          ? _value.curatorPhotos
          : curatorPhotos // ignore: cast_nullable_to_non_nullable
              as List<ImageDTO>,
      profileInfo: profileInfo == freezed
          ? _value.profileInfo
          : profileInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      savedAt: savedAt == freezed
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      draft: draft == freezed
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      showInfo: showInfo == freezed
          ? _value.showInfo
          : showInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileDTO extends _ProfileDTO {
  const _$_ProfileDTO(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'curator_id') required this.curatorId,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      @JsonKey(name: 'firstname') required this.firstname,
      @JsonKey(name: 'lastname') required this.lastname,
      @JsonKey(name: 'age') required this.age,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'have_child') required this.haveChild,
      @JsonKey(name: 'country') required this.country,
      @JsonKey(name: 'city') required this.city,
      @JsonKey(name: 'profile_photos') required this.profilePhotos,
      @JsonKey(name: 'curator_photos') required this.curatorPhotos,
      @JsonKey(name: 'profile_info') required this.profileInfo,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'saved_at') required this.savedAt,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'draft') required this.draft,
      @JsonKey(name: 'is_hidden') required this.isHidden,
      @JsonKey(name: 'show_info') required this.showInfo})
      : super._();

  factory _$_ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDTOFromJson(json);

  @override

  /// User identifier.
  @JsonKey(name: 'id')
  final int id;
  @override

  /// Curator id.
  @JsonKey(name: 'curator_id')
  final int curatorId;
  @override // / User phone number.
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override

  /// User firstname.
  @JsonKey(name: 'firstname')
  final String firstname;
  @override

  /// User lastname.
  @JsonKey(name: 'lastname')
  final String lastname;
  @override

  /// User age.
  @JsonKey(name: 'age')
  final int age;
  @override

  /// User height.
  @JsonKey(name: 'height')
  final int height;
  @override

  /// User gender.
  @JsonKey(name: 'gender')
  final String gender;
  @override

  /// User status.
  @JsonKey(name: 'status')
  final String status;
  @override

  /// A flag responsible to status that user have a child.
  @JsonKey(name: 'have_child')
  final bool haveChild;
  @override

  /// Users country.
  @JsonKey(name: 'country')
  final String country;
  @override

  /// Users city.
  @JsonKey(name: 'city')
  final String city;
  @override

  /// Users profile photos.
  @JsonKey(name: 'profile_photos')
  final List<ImageDTO> profilePhotos;
  @override

  /// Curators photos.
  @JsonKey(name: 'curator_photos')
  final List<ImageDTO> curatorPhotos;
  @override

  /// Users profileInfo.
  @JsonKey(name: 'profile_info')
  final String profileInfo;
  @override

  /// Users created account date.
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override

  /// Users saved account date.
  @JsonKey(name: 'saved_at')
  final String savedAt;
  @override

  /// A flag resposible for status of relationship in active.
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override

  /// ?
  @JsonKey(name: 'draft')
  final bool draft;
  @override

  /// A flag responsible for hidden status account.
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  @override

  /// A flag responsible for hidden account info account.
  @JsonKey(name: 'show_info')
  final bool showInfo;

  @override
  String toString() {
    return 'ProfileDTO(id: $id, curatorId: $curatorId, phoneNumber: $phoneNumber, firstname: $firstname, lastname: $lastname, age: $age, height: $height, gender: $gender, status: $status, haveChild: $haveChild, country: $country, city: $city, profilePhotos: $profilePhotos, curatorPhotos: $curatorPhotos, profileInfo: $profileInfo, createdAt: $createdAt, savedAt: $savedAt, isActive: $isActive, draft: $draft, isHidden: $isHidden, showInfo: $showInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.curatorId, curatorId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.haveChild, haveChild) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.profilePhotos, profilePhotos) &&
            const DeepCollectionEquality()
                .equals(other.curatorPhotos, curatorPhotos) &&
            const DeepCollectionEquality()
                .equals(other.profileInfo, profileInfo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.savedAt, savedAt) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.draft, draft) &&
            const DeepCollectionEquality().equals(other.isHidden, isHidden) &&
            const DeepCollectionEquality().equals(other.showInfo, showInfo));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(curatorId),
        const DeepCollectionEquality().hash(phoneNumber),
        const DeepCollectionEquality().hash(firstname),
        const DeepCollectionEquality().hash(lastname),
        const DeepCollectionEquality().hash(age),
        const DeepCollectionEquality().hash(height),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(haveChild),
        const DeepCollectionEquality().hash(country),
        const DeepCollectionEquality().hash(city),
        const DeepCollectionEquality().hash(profilePhotos),
        const DeepCollectionEquality().hash(curatorPhotos),
        const DeepCollectionEquality().hash(profileInfo),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(savedAt),
        const DeepCollectionEquality().hash(isActive),
        const DeepCollectionEquality().hash(draft),
        const DeepCollectionEquality().hash(isHidden),
        const DeepCollectionEquality().hash(showInfo)
      ]);

  @JsonKey(ignore: true)
  @override
  _$ProfileDTOCopyWith<_ProfileDTO> get copyWith =>
      __$ProfileDTOCopyWithImpl<_ProfileDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDTOToJson(this);
  }
}

abstract class _ProfileDTO extends ProfileDTO {
  const factory _ProfileDTO(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'curator_id') required int curatorId,
      @JsonKey(name: 'phone_number') required String phoneNumber,
      @JsonKey(name: 'firstname') required String firstname,
      @JsonKey(name: 'lastname') required String lastname,
      @JsonKey(name: 'age') required int age,
      @JsonKey(name: 'height') required int height,
      @JsonKey(name: 'gender') required String gender,
      @JsonKey(name: 'status') required String status,
      @JsonKey(name: 'have_child') required bool haveChild,
      @JsonKey(name: 'country') required String country,
      @JsonKey(name: 'city') required String city,
      @JsonKey(name: 'profile_photos') required List<ImageDTO> profilePhotos,
      @JsonKey(name: 'curator_photos') required List<ImageDTO> curatorPhotos,
      @JsonKey(name: 'profile_info') required String profileInfo,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'saved_at') required String savedAt,
      @JsonKey(name: 'is_active') required bool isActive,
      @JsonKey(name: 'draft') required bool draft,
      @JsonKey(name: 'is_hidden') required bool isHidden,
      @JsonKey(name: 'show_info') required bool showInfo}) = _$_ProfileDTO;
  const _ProfileDTO._() : super._();

  factory _ProfileDTO.fromJson(Map<String, dynamic> json) =
      _$_ProfileDTO.fromJson;

  @override

  /// User identifier.
  @JsonKey(name: 'id')
  int get id;
  @override

  /// Curator id.
  @JsonKey(name: 'curator_id')
  int get curatorId;
  @override // / User phone number.
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override

  /// User firstname.
  @JsonKey(name: 'firstname')
  String get firstname;
  @override

  /// User lastname.
  @JsonKey(name: 'lastname')
  String get lastname;
  @override

  /// User age.
  @JsonKey(name: 'age')
  int get age;
  @override

  /// User height.
  @JsonKey(name: 'height')
  int get height;
  @override

  /// User gender.
  @JsonKey(name: 'gender')
  String get gender;
  @override

  /// User status.
  @JsonKey(name: 'status')
  String get status;
  @override

  /// A flag responsible to status that user have a child.
  @JsonKey(name: 'have_child')
  bool get haveChild;
  @override

  /// Users country.
  @JsonKey(name: 'country')
  String get country;
  @override

  /// Users city.
  @JsonKey(name: 'city')
  String get city;
  @override

  /// Users profile photos.
  @JsonKey(name: 'profile_photos')
  List<ImageDTO> get profilePhotos;
  @override

  /// Curators photos.
  @JsonKey(name: 'curator_photos')
  List<ImageDTO> get curatorPhotos;
  @override

  /// Users profileInfo.
  @JsonKey(name: 'profile_info')
  String get profileInfo;
  @override

  /// Users created account date.
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override

  /// Users saved account date.
  @JsonKey(name: 'saved_at')
  String get savedAt;
  @override

  /// A flag resposible for status of relationship in active.
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override

  /// ?
  @JsonKey(name: 'draft')
  bool get draft;
  @override

  /// A flag responsible for hidden status account.
  @JsonKey(name: 'is_hidden')
  bool get isHidden;
  @override

  /// A flag responsible for hidden account info account.
  @JsonKey(name: 'show_info')
  bool get showInfo;
  @override
  @JsonKey(ignore: true)
  _$ProfileDTOCopyWith<_ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
