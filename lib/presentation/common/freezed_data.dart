

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data.freezed.dart';

@freezed

class LoginObject with _$LoginObject {
factory LoginObject(String userName,String password)=_LoginObject;
}

@freezed

class ProfileObject with _$ProfileObject{
  factory ProfileObject(int user_id)=_ProfileObject;
}
@freezed

class SignUpObject with _$SignUpObject{
  factory SignUpObject (
  int city_id,
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
  int university_id ,
      ) =_SignUpObject;
}

@freezed

class UpdateStudentObject with _$UpdateStudentObject{
  factory UpdateStudentObject (
      int studentId,
      {
    int? city_id,
    int? area_id,
    String? street,
    int? subscription_id,
    String? firstName,
    String? lastName,
    String? email,
    String? newPassword_confirmation,
    String? oldPassword,
    String? newPassword,
    String? phoneNumber,
    int? transportation_line_id,
    int? transfer_position_id,
    File? image,
    int? university_id ,
}
  ) =_UpdateStudentObject;
}
