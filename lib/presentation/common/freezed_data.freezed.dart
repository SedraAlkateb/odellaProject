// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String password) =
      _$_LoginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileObject {
  int get user_id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileObjectCopyWith<ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileObjectCopyWith<$Res> {
  factory $ProfileObjectCopyWith(
          ProfileObject value, $Res Function(ProfileObject) then) =
      _$ProfileObjectCopyWithImpl<$Res, ProfileObject>;
  @useResult
  $Res call({int user_id});
}

/// @nodoc
class _$ProfileObjectCopyWithImpl<$Res, $Val extends ProfileObject>
    implements $ProfileObjectCopyWith<$Res> {
  _$ProfileObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
  }) {
    return _then(_value.copyWith(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileObjectCopyWith<$Res>
    implements $ProfileObjectCopyWith<$Res> {
  factory _$$_ProfileObjectCopyWith(
          _$_ProfileObject value, $Res Function(_$_ProfileObject) then) =
      __$$_ProfileObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int user_id});
}

/// @nodoc
class __$$_ProfileObjectCopyWithImpl<$Res>
    extends _$ProfileObjectCopyWithImpl<$Res, _$_ProfileObject>
    implements _$$_ProfileObjectCopyWith<$Res> {
  __$$_ProfileObjectCopyWithImpl(
      _$_ProfileObject _value, $Res Function(_$_ProfileObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
  }) {
    return _then(_$_ProfileObject(
      null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProfileObject implements _ProfileObject {
  _$_ProfileObject(this.user_id);

  @override
  final int user_id;

  @override
  String toString() {
    return 'ProfileObject(user_id: $user_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileObject &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      __$$_ProfileObjectCopyWithImpl<_$_ProfileObject>(this, _$identity);
}

abstract class _ProfileObject implements ProfileObject {
  factory _ProfileObject(final int user_id) = _$_ProfileObject;

  @override
  int get user_id;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpObject {
  int get city_id => throw _privateConstructorUsedError;
  int get area_id => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  int get subscription_id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  int get transportation_line_id => throw _privateConstructorUsedError;
  int get transfer_position_id => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  int get university_id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpObjectCopyWith<SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpObjectCopyWith<$Res> {
  factory $SignUpObjectCopyWith(
          SignUpObject value, $Res Function(SignUpObject) then) =
      _$SignUpObjectCopyWithImpl<$Res, SignUpObject>;
  @useResult
  $Res call(
      {int city_id,
      int area_id,
      String street,
      int subscription_id,
      String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber,
      int transportation_line_id,
      int transfer_position_id,
      File? image,
      int university_id});
}

/// @nodoc
class _$SignUpObjectCopyWithImpl<$Res, $Val extends SignUpObject>
    implements $SignUpObjectCopyWith<$Res> {
  _$SignUpObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city_id = null,
    Object? area_id = null,
    Object? street = null,
    Object? subscription_id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? transportation_line_id = null,
    Object? transfer_position_id = null,
    Object? image = freezed,
    Object? university_id = null,
  }) {
    return _then(_value.copyWith(
      city_id: null == city_id
          ? _value.city_id
          : city_id // ignore: cast_nullable_to_non_nullable
              as int,
      area_id: null == area_id
          ? _value.area_id
          : area_id // ignore: cast_nullable_to_non_nullable
              as int,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      subscription_id: null == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      transportation_line_id: null == transportation_line_id
          ? _value.transportation_line_id
          : transportation_line_id // ignore: cast_nullable_to_non_nullable
              as int,
      transfer_position_id: null == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      university_id: null == university_id
          ? _value.university_id
          : university_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpObjectCopyWith<$Res>
    implements $SignUpObjectCopyWith<$Res> {
  factory _$$_SignUpObjectCopyWith(
          _$_SignUpObject value, $Res Function(_$_SignUpObject) then) =
      __$$_SignUpObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int city_id,
      int area_id,
      String street,
      int subscription_id,
      String firstName,
      String lastName,
      String email,
      String password,
      String phoneNumber,
      int transportation_line_id,
      int transfer_position_id,
      File? image,
      int university_id});
}

/// @nodoc
class __$$_SignUpObjectCopyWithImpl<$Res>
    extends _$SignUpObjectCopyWithImpl<$Res, _$_SignUpObject>
    implements _$$_SignUpObjectCopyWith<$Res> {
  __$$_SignUpObjectCopyWithImpl(
      _$_SignUpObject _value, $Res Function(_$_SignUpObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city_id = null,
    Object? area_id = null,
    Object? street = null,
    Object? subscription_id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phoneNumber = null,
    Object? transportation_line_id = null,
    Object? transfer_position_id = null,
    Object? image = freezed,
    Object? university_id = null,
  }) {
    return _then(_$_SignUpObject(
      null == city_id
          ? _value.city_id
          : city_id // ignore: cast_nullable_to_non_nullable
              as int,
      null == area_id
          ? _value.area_id
          : area_id // ignore: cast_nullable_to_non_nullable
              as int,
      null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      null == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int,
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == transportation_line_id
          ? _value.transportation_line_id
          : transportation_line_id // ignore: cast_nullable_to_non_nullable
              as int,
      null == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      null == university_id
          ? _value.university_id
          : university_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SignUpObject implements _SignUpObject {
  _$_SignUpObject(
      this.city_id,
      this.area_id,
      this.street,
      this.subscription_id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.transportation_line_id,
      this.transfer_position_id,
      this.image,
      this.university_id);

  @override
  final int city_id;
  @override
  final int area_id;
  @override
  final String street;
  @override
  final int subscription_id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phoneNumber;
  @override
  final int transportation_line_id;
  @override
  final int transfer_position_id;
  @override
  final File? image;
  @override
  final int university_id;

  @override
  String toString() {
    return 'SignUpObject(city_id: $city_id, area_id: $area_id, street: $street, subscription_id: $subscription_id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNumber: $phoneNumber, transportation_line_id: $transportation_line_id, transfer_position_id: $transfer_position_id, image: $image, university_id: $university_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpObject &&
            (identical(other.city_id, city_id) || other.city_id == city_id) &&
            (identical(other.area_id, area_id) || other.area_id == area_id) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.subscription_id, subscription_id) ||
                other.subscription_id == subscription_id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.transportation_line_id, transportation_line_id) ||
                other.transportation_line_id == transportation_line_id) &&
            (identical(other.transfer_position_id, transfer_position_id) ||
                other.transfer_position_id == transfer_position_id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.university_id, university_id) ||
                other.university_id == university_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      city_id,
      area_id,
      street,
      subscription_id,
      firstName,
      lastName,
      email,
      password,
      phoneNumber,
      transportation_line_id,
      transfer_position_id,
      image,
      university_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      __$$_SignUpObjectCopyWithImpl<_$_SignUpObject>(this, _$identity);
}

abstract class _SignUpObject implements SignUpObject {
  factory _SignUpObject(
      final int city_id,
      final int area_id,
      final String street,
      final int subscription_id,
      final String firstName,
      final String lastName,
      final String email,
      final String password,
      final String phoneNumber,
      final int transportation_line_id,
      final int transfer_position_id,
      final File? image,
      final int university_id) = _$_SignUpObject;

  @override
  int get city_id;
  @override
  int get area_id;
  @override
  String get street;
  @override
  int get subscription_id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phoneNumber;
  @override
  int get transportation_line_id;
  @override
  int get transfer_position_id;
  @override
  File? get image;
  @override
  int get university_id;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateStudentObject {
  int get studentId => throw _privateConstructorUsedError;
  int? get city_id => throw _privateConstructorUsedError;
  int? get area_id => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  int? get subscription_id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get transportation_line_id => throw _privateConstructorUsedError;
  int? get transfer_position_id => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  int? get university_id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateStudentObjectCopyWith<UpdateStudentObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStudentObjectCopyWith<$Res> {
  factory $UpdateStudentObjectCopyWith(
          UpdateStudentObject value, $Res Function(UpdateStudentObject) then) =
      _$UpdateStudentObjectCopyWithImpl<$Res, UpdateStudentObject>;
  @useResult
  $Res call(
      {int studentId,
      int? city_id,
      int? area_id,
      String? street,
      int? subscription_id,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      int? transportation_line_id,
      int? transfer_position_id,
      File? image,
      int? university_id});
}

/// @nodoc
class _$UpdateStudentObjectCopyWithImpl<$Res, $Val extends UpdateStudentObject>
    implements $UpdateStudentObjectCopyWith<$Res> {
  _$UpdateStudentObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? city_id = freezed,
    Object? area_id = freezed,
    Object? street = freezed,
    Object? subscription_id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? transportation_line_id = freezed,
    Object? transfer_position_id = freezed,
    Object? image = freezed,
    Object? university_id = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      city_id: freezed == city_id
          ? _value.city_id
          : city_id // ignore: cast_nullable_to_non_nullable
              as int?,
      area_id: freezed == area_id
          ? _value.area_id
          : area_id // ignore: cast_nullable_to_non_nullable
              as int?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transportation_line_id: freezed == transportation_line_id
          ? _value.transportation_line_id
          : transportation_line_id // ignore: cast_nullable_to_non_nullable
              as int?,
      transfer_position_id: freezed == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      university_id: freezed == university_id
          ? _value.university_id
          : university_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateStudentObjectCopyWith<$Res>
    implements $UpdateStudentObjectCopyWith<$Res> {
  factory _$$_UpdateStudentObjectCopyWith(_$_UpdateStudentObject value,
          $Res Function(_$_UpdateStudentObject) then) =
      __$$_UpdateStudentObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int studentId,
      int? city_id,
      int? area_id,
      String? street,
      int? subscription_id,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      int? transportation_line_id,
      int? transfer_position_id,
      File? image,
      int? university_id});
}

/// @nodoc
class __$$_UpdateStudentObjectCopyWithImpl<$Res>
    extends _$UpdateStudentObjectCopyWithImpl<$Res, _$_UpdateStudentObject>
    implements _$$_UpdateStudentObjectCopyWith<$Res> {
  __$$_UpdateStudentObjectCopyWithImpl(_$_UpdateStudentObject _value,
      $Res Function(_$_UpdateStudentObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? city_id = freezed,
    Object? area_id = freezed,
    Object? street = freezed,
    Object? subscription_id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? transportation_line_id = freezed,
    Object? transfer_position_id = freezed,
    Object? image = freezed,
    Object? university_id = freezed,
  }) {
    return _then(_$_UpdateStudentObject(
      null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      city_id: freezed == city_id
          ? _value.city_id
          : city_id // ignore: cast_nullable_to_non_nullable
              as int?,
      area_id: freezed == area_id
          ? _value.area_id
          : area_id // ignore: cast_nullable_to_non_nullable
              as int?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      transportation_line_id: freezed == transportation_line_id
          ? _value.transportation_line_id
          : transportation_line_id // ignore: cast_nullable_to_non_nullable
              as int?,
      transfer_position_id: freezed == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      university_id: freezed == university_id
          ? _value.university_id
          : university_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_UpdateStudentObject implements _UpdateStudentObject {
  _$_UpdateStudentObject(this.studentId,
      {this.city_id,
      this.area_id,
      this.street,
      this.subscription_id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.transportation_line_id,
      this.transfer_position_id,
      this.image,
      this.university_id});

  @override
  final int studentId;
  @override
  final int? city_id;
  @override
  final int? area_id;
  @override
  final String? street;
  @override
  final int? subscription_id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final int? transportation_line_id;
  @override
  final int? transfer_position_id;
  @override
  final File? image;
  @override
  final int? university_id;

  @override
  String toString() {
    return 'UpdateStudentObject(studentId: $studentId, city_id: $city_id, area_id: $area_id, street: $street, subscription_id: $subscription_id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, transportation_line_id: $transportation_line_id, transfer_position_id: $transfer_position_id, image: $image, university_id: $university_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateStudentObject &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.city_id, city_id) || other.city_id == city_id) &&
            (identical(other.area_id, area_id) || other.area_id == area_id) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.subscription_id, subscription_id) ||
                other.subscription_id == subscription_id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.transportation_line_id, transportation_line_id) ||
                other.transportation_line_id == transportation_line_id) &&
            (identical(other.transfer_position_id, transfer_position_id) ||
                other.transfer_position_id == transfer_position_id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.university_id, university_id) ||
                other.university_id == university_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      studentId,
      city_id,
      area_id,
      street,
      subscription_id,
      firstName,
      lastName,
      email,
      phoneNumber,
      transportation_line_id,
      transfer_position_id,
      image,
      university_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateStudentObjectCopyWith<_$_UpdateStudentObject> get copyWith =>
      __$$_UpdateStudentObjectCopyWithImpl<_$_UpdateStudentObject>(
          this, _$identity);
}

abstract class _UpdateStudentObject implements UpdateStudentObject {
  factory _UpdateStudentObject(final int studentId,
      {final int? city_id,
      final int? area_id,
      final String? street,
      final int? subscription_id,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? phoneNumber,
      final int? transportation_line_id,
      final int? transfer_position_id,
      final File? image,
      final int? university_id}) = _$_UpdateStudentObject;

  @override
  int get studentId;
  @override
  int? get city_id;
  @override
  int? get area_id;
  @override
  String? get street;
  @override
  int? get subscription_id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  int? get transportation_line_id;
  @override
  int? get transfer_position_id;
  @override
  File? get image;
  @override
  int? get university_id;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateStudentObjectCopyWith<_$_UpdateStudentObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordObject {
  String get email => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordObjectCopyWith<ResetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordObjectCopyWith<$Res> {
  factory $ResetPasswordObjectCopyWith(
          ResetPasswordObject value, $Res Function(ResetPasswordObject) then) =
      _$ResetPasswordObjectCopyWithImpl<$Res, ResetPasswordObject>;
  @useResult
  $Res call({String email, int code, String newPassword});
}

/// @nodoc
class _$ResetPasswordObjectCopyWithImpl<$Res, $Val extends ResetPasswordObject>
    implements $ResetPasswordObjectCopyWith<$Res> {
  _$ResetPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordObjectCopyWith<$Res>
    implements $ResetPasswordObjectCopyWith<$Res> {
  factory _$$_ResetPasswordObjectCopyWith(_$_ResetPasswordObject value,
          $Res Function(_$_ResetPasswordObject) then) =
      __$$_ResetPasswordObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, int code, String newPassword});
}

/// @nodoc
class __$$_ResetPasswordObjectCopyWithImpl<$Res>
    extends _$ResetPasswordObjectCopyWithImpl<$Res, _$_ResetPasswordObject>
    implements _$$_ResetPasswordObjectCopyWith<$Res> {
  __$$_ResetPasswordObjectCopyWithImpl(_$_ResetPasswordObject _value,
      $Res Function(_$_ResetPasswordObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPassword = null,
  }) {
    return _then(_$_ResetPasswordObject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordObject implements _ResetPasswordObject {
  _$_ResetPasswordObject(this.email, this.code, this.newPassword);

  @override
  final String email;
  @override
  final int code;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ResetPasswordObject(email: $email, code: $code, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordObject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordObjectCopyWith<_$_ResetPasswordObject> get copyWith =>
      __$$_ResetPasswordObjectCopyWithImpl<_$_ResetPasswordObject>(
          this, _$identity);
}

abstract class _ResetPasswordObject implements ResetPasswordObject {
  factory _ResetPasswordObject(
          final String email, final int code, final String newPassword) =
      _$_ResetPasswordObject;

  @override
  String get email;
  @override
  int get code;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordObjectCopyWith<_$_ResetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LostItemObject {
  int get tripId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LostItemObjectCopyWith<LostItemObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LostItemObjectCopyWith<$Res> {
  factory $LostItemObjectCopyWith(
          LostItemObject value, $Res Function(LostItemObject) then) =
      _$LostItemObjectCopyWithImpl<$Res, LostItemObject>;
  @useResult
  $Res call({int tripId, String description, File? image});
}

/// @nodoc
class _$LostItemObjectCopyWithImpl<$Res, $Val extends LostItemObject>
    implements $LostItemObjectCopyWith<$Res> {
  _$LostItemObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? description = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LostItemObjectCopyWith<$Res>
    implements $LostItemObjectCopyWith<$Res> {
  factory _$$_LostItemObjectCopyWith(
          _$_LostItemObject value, $Res Function(_$_LostItemObject) then) =
      __$$_LostItemObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tripId, String description, File? image});
}

/// @nodoc
class __$$_LostItemObjectCopyWithImpl<$Res>
    extends _$LostItemObjectCopyWithImpl<$Res, _$_LostItemObject>
    implements _$$_LostItemObjectCopyWith<$Res> {
  __$$_LostItemObjectCopyWithImpl(
      _$_LostItemObject _value, $Res Function(_$_LostItemObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? description = null,
    Object? image = freezed,
  }) {
    return _then(_$_LostItemObject(
      null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_LostItemObject implements _LostItemObject {
  _$_LostItemObject(this.tripId, this.description, this.image);

  @override
  final int tripId;
  @override
  final String description;
  @override
  final File? image;

  @override
  String toString() {
    return 'LostItemObject(tripId: $tripId, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LostItemObject &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tripId, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LostItemObjectCopyWith<_$_LostItemObject> get copyWith =>
      __$$_LostItemObjectCopyWithImpl<_$_LostItemObject>(this, _$identity);
}

abstract class _LostItemObject implements LostItemObject {
  factory _LostItemObject(
          final int tripId, final String description, final File? image) =
      _$_LostItemObject;

  @override
  int get tripId;
  @override
  String get description;
  @override
  File? get image;
  @override
  @JsonKey(ignore: true)
  _$$_LostItemObjectCopyWith<_$_LostItemObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyReservationObject {
  int get tripId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  int get transfer_position_id => throw _privateConstructorUsedError;
  int get seet => throw _privateConstructorUsedError;
  String get fcm_token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyReservationObjectCopyWith<DailyReservationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReservationObjectCopyWith<$Res> {
  factory $DailyReservationObjectCopyWith(DailyReservationObject value,
          $Res Function(DailyReservationObject) then) =
      _$DailyReservationObjectCopyWithImpl<$Res, DailyReservationObject>;
  @useResult
  $Res call(
      {int tripId,
      String name,
      int phone,
      int transfer_position_id,
      int seet,
      String fcm_token});
}

/// @nodoc
class _$DailyReservationObjectCopyWithImpl<$Res,
        $Val extends DailyReservationObject>
    implements $DailyReservationObjectCopyWith<$Res> {
  _$DailyReservationObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? name = null,
    Object? phone = null,
    Object? transfer_position_id = null,
    Object? seet = null,
    Object? fcm_token = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      transfer_position_id: null == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int,
      seet: null == seet
          ? _value.seet
          : seet // ignore: cast_nullable_to_non_nullable
              as int,
      fcm_token: null == fcm_token
          ? _value.fcm_token
          : fcm_token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyReservationObjectCopyWith<$Res>
    implements $DailyReservationObjectCopyWith<$Res> {
  factory _$$_DailyReservationObjectCopyWith(_$_DailyReservationObject value,
          $Res Function(_$_DailyReservationObject) then) =
      __$$_DailyReservationObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tripId,
      String name,
      int phone,
      int transfer_position_id,
      int seet,
      String fcm_token});
}

/// @nodoc
class __$$_DailyReservationObjectCopyWithImpl<$Res>
    extends _$DailyReservationObjectCopyWithImpl<$Res,
        _$_DailyReservationObject>
    implements _$$_DailyReservationObjectCopyWith<$Res> {
  __$$_DailyReservationObjectCopyWithImpl(_$_DailyReservationObject _value,
      $Res Function(_$_DailyReservationObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? name = null,
    Object? phone = null,
    Object? transfer_position_id = null,
    Object? seet = null,
    Object? fcm_token = null,
  }) {
    return _then(_$_DailyReservationObject(
      null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      null == transfer_position_id
          ? _value.transfer_position_id
          : transfer_position_id // ignore: cast_nullable_to_non_nullable
              as int,
      null == seet
          ? _value.seet
          : seet // ignore: cast_nullable_to_non_nullable
              as int,
      null == fcm_token
          ? _value.fcm_token
          : fcm_token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DailyReservationObject implements _DailyReservationObject {
  _$_DailyReservationObject(this.tripId, this.name, this.phone,
      this.transfer_position_id, this.seet, this.fcm_token);

  @override
  final int tripId;
  @override
  final String name;
  @override
  final int phone;
  @override
  final int transfer_position_id;
  @override
  final int seet;
  @override
  final String fcm_token;

  @override
  String toString() {
    return 'DailyReservationObject(tripId: $tripId, name: $name, phone: $phone, transfer_position_id: $transfer_position_id, seet: $seet, fcm_token: $fcm_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyReservationObject &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.transfer_position_id, transfer_position_id) ||
                other.transfer_position_id == transfer_position_id) &&
            (identical(other.seet, seet) || other.seet == seet) &&
            (identical(other.fcm_token, fcm_token) ||
                other.fcm_token == fcm_token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tripId, name, phone, transfer_position_id, seet, fcm_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyReservationObjectCopyWith<_$_DailyReservationObject> get copyWith =>
      __$$_DailyReservationObjectCopyWithImpl<_$_DailyReservationObject>(
          this, _$identity);
}

abstract class _DailyReservationObject implements DailyReservationObject {
  factory _DailyReservationObject(
      final int tripId,
      final String name,
      final int phone,
      final int transfer_position_id,
      final int seet,
      final String fcm_token) = _$_DailyReservationObject;

  @override
  int get tripId;
  @override
  String get name;
  @override
  int get phone;
  @override
  int get transfer_position_id;
  @override
  int get seet;
  @override
  String get fcm_token;
  @override
  @JsonKey(ignore: true)
  _$$_DailyReservationObjectCopyWith<_$_DailyReservationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChangePasswordObject {
  String get newPassword_confirmation => throw _privateConstructorUsedError;
  String get oldPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordObjectCopyWith<ChangePasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordObjectCopyWith<$Res> {
  factory $ChangePasswordObjectCopyWith(ChangePasswordObject value,
          $Res Function(ChangePasswordObject) then) =
      _$ChangePasswordObjectCopyWithImpl<$Res, ChangePasswordObject>;
  @useResult
  $Res call(
      {String newPassword_confirmation,
      String oldPassword,
      String newPassword});
}

/// @nodoc
class _$ChangePasswordObjectCopyWithImpl<$Res,
        $Val extends ChangePasswordObject>
    implements $ChangePasswordObjectCopyWith<$Res> {
  _$ChangePasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword_confirmation = null,
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword_confirmation: null == newPassword_confirmation
          ? _value.newPassword_confirmation
          : newPassword_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangePasswordObjectCopyWith<$Res>
    implements $ChangePasswordObjectCopyWith<$Res> {
  factory _$$_ChangePasswordObjectCopyWith(_$_ChangePasswordObject value,
          $Res Function(_$_ChangePasswordObject) then) =
      __$$_ChangePasswordObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String newPassword_confirmation,
      String oldPassword,
      String newPassword});
}

/// @nodoc
class __$$_ChangePasswordObjectCopyWithImpl<$Res>
    extends _$ChangePasswordObjectCopyWithImpl<$Res, _$_ChangePasswordObject>
    implements _$$_ChangePasswordObjectCopyWith<$Res> {
  __$$_ChangePasswordObjectCopyWithImpl(_$_ChangePasswordObject _value,
      $Res Function(_$_ChangePasswordObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword_confirmation = null,
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$_ChangePasswordObject(
      null == newPassword_confirmation
          ? _value.newPassword_confirmation
          : newPassword_confirmation // ignore: cast_nullable_to_non_nullable
              as String,
      null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangePasswordObject implements _ChangePasswordObject {
  _$_ChangePasswordObject(
      this.newPassword_confirmation, this.oldPassword, this.newPassword);

  @override
  final String newPassword_confirmation;
  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordObject(newPassword_confirmation: $newPassword_confirmation, oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordObject &&
            (identical(
                    other.newPassword_confirmation, newPassword_confirmation) ||
                other.newPassword_confirmation == newPassword_confirmation) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, newPassword_confirmation, oldPassword, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordObjectCopyWith<_$_ChangePasswordObject> get copyWith =>
      __$$_ChangePasswordObjectCopyWithImpl<_$_ChangePasswordObject>(
          this, _$identity);
}

abstract class _ChangePasswordObject implements ChangePasswordObject {
  factory _ChangePasswordObject(
      final String newPassword_confirmation,
      final String oldPassword,
      final String newPassword) = _$_ChangePasswordObject;

  @override
  String get newPassword_confirmation;
  @override
  String get oldPassword;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordObjectCopyWith<_$_ChangePasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}
