import 'dart:io';

class DailyReservationRequest {
  int trip;
  String name;
  int phoneNumber;
  int transfer_position_id;
  int seatsNumber;
  String fcm_token;
  DailyReservationRequest(
      this.trip, this.name, this.phoneNumber,
      this.transfer_position_id, this.seatsNumber, this.fcm_token);
}
class PositionMap {
  int tripId;
  double lng;
  double lat;

  PositionMap(this.tripId, this.lng, this.lat);
}
class LoginRequest {
  String email;
  String password;
  String fcmtoken;
  LoginRequest(this.fcmtoken, this.email, this.password);
}
class ConfirmQrRequest {
  int userId;
  int tripID;
  ConfirmQrRequest(this.userId, this.tripID);
}
class SignUpRequest {
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
  int university_id;
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
      {this.image});
}

class ConfirmStudent {
  int studentId;
  bool? confirmAttendance1;
  bool? confirmAttendance2;

  ConfirmStudent(this.studentId,
      {this.confirmAttendance1, this.confirmAttendance2});
}

class UpdateStudentRequest {
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
  String? university_id;

  UpdateStudentRequest(
    this.studentId, {
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
  });
}

class UpdataSupervisorRequest {
  int supervisorId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? cityId;
  int? areaId;
  String? street;

  UpdataSupervisorRequest(this.supervisorId,
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.cityId,
      this.areaId,
      this.street});
}

class ClaimRequest {
  int trip_id;
  String description;

  ClaimRequest(
    this.trip_id,
    this.description,
  );
}

class DescriptionRequest {
  int trip_id;
  String description;
  File? image;

  DescriptionRequest(
    this.trip_id,
    this.description, {
    this.image,
  });
}

class UpdateImage {
  int studentId;
  File image;

  UpdateImage(this.studentId, this.image);
}

class UpdatePasswordRequest {
  int studentId;
  String oldPassword;
  String newPassword;
  String newPassword_confirmation;

  UpdatePasswordRequest(
    this.studentId,
    this.oldPassword,
    this.newPassword,
    this.newPassword_confirmation,
  );
}

class RestPasswordRequest {
  String email;
  int code;
  String newPassword;

  RestPasswordRequest(this.email, this.code, this.newPassword);
}

class EvaluationRequest {
  int tripId;
  int review;

  EvaluationRequest(this.tripId, this.review);
}
