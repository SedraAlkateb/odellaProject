
import 'dart:io';

class LoginRequest{
  String email;
  String password;
  String fcmtoken;
  LoginRequest(this.email,this.password,this.fcmtoken);
}
class SignUpRequest{
  int city_id;
  int area_id;
  String street;
  int subscription_id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  int transportation_line_id;
  int transfer_position_id;
  int university_id ;
  File? image;

  SignUpRequest(
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
      this.university_id,
      {
        this.image
      }
      );
}
class ConfirmStudent{
  int studentId;
  bool confirmAttendance1;

  ConfirmStudent(this.studentId, this.confirmAttendance1);
}
class UpdateStudentRequest{
  int studentId;
  int? city_id;
  int? area_id;
  String? street;
  String? subscription_id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? transportation_line_id;
  String? transfer_position_id;
  File? image;
  String? university_id ;


  UpdateStudentRequest(
      this.studentId,
      {
        this.city_id,
        this.area_id,
        this.street,
        this.subscription_id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.transportation_line_id,
        this.transfer_position_id,
        this.image,
        this.university_id,


      }      );
}
class UpdateImage{
  int studentId;
  File image;

  UpdateImage(this.studentId, this.image);
}
class UpdatePasswordRequest{

  int studentId;
  String newPassword_confirmation;
  String oldPassword;
  String newPassword;

  UpdatePasswordRequest(
      this.studentId,
      this.newPassword_confirmation,
      this.oldPassword,
      this.newPassword
      );

}

