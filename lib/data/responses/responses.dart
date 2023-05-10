import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/responses/responses.dart';
part 'responses.g.dart';
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? massage;

}

@JsonSerializable()
class LogOutResponse  extends BaseResponse{
  @JsonKey(name: "data")
  List data;

  LogOutResponse(this.data);

  factory LogOutResponse.fromJson(Map<String,dynamic> json ) =>
      _$LogOutResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LogOutResponseToJson(this);

}

@JsonSerializable()
class PostResponse  extends BaseResponse{
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "body")
  String? body;
  PostResponse(this.userId, this.id, this.title, this.body); // from json
//from json

  factory PostResponse.fromJson(Map<String,dynamic> json ) =>
      _$PostResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PostResponseToJson(this);

}
@JsonSerializable()
class StudentRequest  {
  int? city_id;
  int? area_id;
  String? street;
  String? subscription_id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? transportation_line_id;
  String? transfer_position_id;
  String? university_id ;
  StudentRequest(
      {
        this.city_id,
        this.area_id,
        this.street,
        this.subscription_id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.transportation_line_id,
        this.transfer_position_id,
        this.university_id,
      }
      );//from json
  factory StudentRequest.fromJson(Map<String,dynamic> json ) =>
      _$StudentRequestFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$StudentRequestToJson(this);

}

@JsonSerializable()
class PasswordRequest  {

  String? newPassword_confirmation;
  String? oldPassword;
  String? newPassword;

  PasswordRequest(
      {
        this.newPassword_confirmation,
        this.newPassword,
        this.oldPassword,
      }
      );//from json
  factory PasswordRequest.fromJson(Map<String,dynamic> json ) =>
      _$PasswordRequestFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PasswordRequestToJson(this);

}
@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "access_token")
  String? access_token;
  @JsonKey(name: "token_type")
  String? token_type;
  @JsonKey(name: "expires_in")
  int? expires_in;
  @JsonKey(name:"user")
  UserResponse? userResponse;

  UserDataResponse(
      this.access_token, this.token_type, this.expires_in, this.userResponse);


  factory UserDataResponse.fromJson(Map<String,dynamic> json ) =>
      _$UserDataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UserDataResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "location_id")
  String? location_id;
  @JsonKey(name: "subscription_id")
  String? subscription_id;
  @JsonKey(name: "transportation_line_id")
  String? transportation_line_id;
  @JsonKey(name: "transfer_position_id")
  String? transfer_position_id;
  @JsonKey(name: "university_id")
  String? university_id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "email_verified_at")
  String? email_verified_at;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "fcm_token")
  String? fcm_token;
  @JsonKey(name: "roles")
  List<RoleResponse>? roles;
  UserResponse(
      this.id,
      this.location_id,
      this.subscription_id,
      this.transportation_line_id,
      this.transfer_position_id,
      this.university_id,
      this.status,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.email_verified_at,
      this.roles); //from json

  factory UserResponse.fromJson(Map<String,dynamic> json ) =>
      _$UserResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UserResponseToJson(this);

}
@JsonSerializable()
class UpdateStudentResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "location_id")
  String? location_id;
  @JsonKey(name: "subscription_id")
  String? subscription_id;
  @JsonKey(name: "expiredSubscriptionDate")
  String? expiredSubscriptionDate;
  @JsonKey(name: "transportation_line_id")
  String? transportation_line_id;
  @JsonKey(name: "transfer_position_id")
  String? transfer_position_id;
  @JsonKey(name: "university_id")
  String? university_id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "email_verified_at")
  String? email_verified_at;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "fcm_token")
  String? fcm_token;
  @JsonKey(name: "location")
  LocationResponse? locationResponse;


  UpdateStudentResponse(
      this.id,
      this.location_id,
      this.subscription_id,
      this.expiredSubscriptionDate,
      this.transportation_line_id,
      this.transfer_position_id,
      this.university_id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.email_verified_at,
      this.status,
      this.fcm_token,
      this.locationResponse); //from json

  factory UpdateStudentResponse.fromJson(Map<String,dynamic> json ) =>
      _$UpdateStudentResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UpdateStudentResponseToJson(this);

}
@JsonSerializable()
class UpdateStResponse extends BaseResponse {
  @JsonKey(name:"data")
  UpdateStudentResponse? updateStudentResponse;

  UpdateStResponse(this.updateStudentResponse);
  // from json
  factory UpdateStResponse.fromJson(Map<String,dynamic>json)=>
      _$UpdateStResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$UpdateStResponseToJson(this);

}
@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "location_id")
  int? location_id;
  @JsonKey(name: "subscription_id")
  String? subscription_id;
  @JsonKey(name: "transportation_line_id")
  String? transportation_line_id;
  @JsonKey(name: "transfer_position_id")
  String? transfer_position_id;
  @JsonKey(name: "university_id")
  String? university_id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "roles")
  List<RoleResponse>? roles;

  RegisterResponse(
      this.id,
      this.location_id,
      this.subscription_id,
      this.transportation_line_id,
      this.transfer_position_id,
      this.university_id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.roles);

  factory RegisterResponse.fromJson(Map<String,dynamic> json ) =>
      _$RegisterResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$RegisterResponseToJson(this);

}
@JsonSerializable()
class RoleResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "guard_name")
  String? guard_name;
  @JsonKey(name: "created_at")
  String? created_at;
  @JsonKey(name: "updated_at")
  String? updated_at;
  @JsonKey(name: "pivot")
  PivotResponse? pivot;


  RoleResponse(this.id, this.name, this.guard_name, this.created_at,
      this.updated_at, this.pivot);

  factory RoleResponse.fromJson(Map<String,dynamic> json ) =>
      _$RoleResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$RoleResponseToJson(this);

}
@JsonSerializable()
class LocationResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "city_id")
  String? city_id;
  @JsonKey(name: "area_id")
  String? area_id;
  @JsonKey(name: "street")
  String? street;

  LocationResponse(this.id, this.city_id, this.area_id, this.street);

  factory LocationResponse.fromJson(Map<String,dynamic> json ) =>
      _$LocationResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LocationResponseToJson(this);

}
//////////////////Location by id/////
@JsonSerializable()
class LocationDataResponse {

  @JsonKey(name: "city")
  CityResponse? cityResponse;
  @JsonKey(name: "area")
  AreaResponse? areaResponse;
  @JsonKey(name: "street")
  String? street;


  LocationDataResponse(this.cityResponse, this.areaResponse, this.street);

  factory LocationDataResponse.fromJson(Map<String,dynamic> json ) =>
      _$LocationDataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LocationDataResponseToJson(this);

}
@JsonSerializable()
class LocationsResponse extends BaseResponse{
  @JsonKey(name: "data")
  LocationDataResponse? locationDataResponse;
  LocationsResponse(this.locationDataResponse);

  factory LocationsResponse.fromJson(Map<String,dynamic> json ) =>
      _$LocationsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LocationsResponseToJson(this);

}

//////////////CITIES/////////
@JsonSerializable()
class CitiesDataResponse  {
  @JsonKey(name:"data")
  List<CityResponse>? cityResponse;
  @JsonKey(name:"current_page")
  int? current_page;
  @JsonKey(name:"first_page_url")
  String? first_page_url;
  @JsonKey(name:"from")
  int? from;
  @JsonKey(name:"last_page")
  int? last_page;
  @JsonKey(name:"last_page_url")
  String? last_page_url;

  @JsonKey(name:"next_page_url")
  String? next_page_url;
  @JsonKey(name:"path")
  String? path;
  @JsonKey(name:"prev_page_url")
  String? prev_page_url;
  @JsonKey(name:"per_page")
  int? per_page;
  @JsonKey(name:"to")
  int? to;
  @JsonKey(name:"total")
  int? total;
  @JsonKey(name:"links")
  List<LinkResponse>? links;

  CitiesDataResponse(
      this.cityResponse,
      this.current_page,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.next_page_url,
      this.path,
      this.prev_page_url,
      this.per_page,
      this.to,
      this.total,
      this.links); // from json
  factory CitiesDataResponse.fromJson(Map<String,dynamic>json)=>
      _$CitiesDataResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$CitiesDataResponseToJson(this);

}
@JsonSerializable()
class CityResponse {
  @JsonKey(name: "id")
  int? cityId;
  @JsonKey(name: "name")
  String? name;
  CityResponse(this.cityId, this.name);
  factory CityResponse.fromJson(Map<String,dynamic> json ) =>
      _$CityResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$CityResponseToJson(this);

}
@JsonSerializable()
class CitiesResponse extends BaseResponse{
  @JsonKey(name: "data")
  CitiesDataResponse? citiesDataResponse;
  CitiesResponse(this.citiesDataResponse);

  factory CitiesResponse.fromJson(Map<String,dynamic> json ) =>
      _$CitiesResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$CitiesResponseToJson(this);

}
/////////////////AREA////////////
@JsonSerializable()
class AreasResponse extends BaseResponse{
  @JsonKey(name: "data")

  List<AreaResponse>? areaResponse;

  AreasResponse(this.areaResponse);

  factory AreasResponse.fromJson(Map<String,dynamic> json ) =>
      _$AreasResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$AreasResponseToJson(this);

}
@JsonSerializable()
class AreaResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  int? id;
  AreaResponse( this.name,this.id);
  factory AreaResponse.fromJson(Map<String,dynamic> json ) =>
      _$AreaResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$AreaResponseToJson(this);

}
/////////////////////////////

@JsonSerializable()
class PivotResponse {
  @JsonKey(name: "model_id")
  String? model_id;
  @JsonKey(name: "role_id")
  String? role_id;
  @JsonKey(name: "model_type")
  String? model_type;


  PivotResponse(this.model_id, this.role_id, this.model_type);

  factory PivotResponse.fromJson(Map<String,dynamic> json ) =>
      _$PivotResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PivotResponseToJson(this);

}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name:"data")
  UserDataResponse? dataUserResponse;
  AuthenticationResponse(this.dataUserResponse); // from json
  factory AuthenticationResponse.fromJson(Map<String,dynamic>json)=>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$AuthenticationResponseToJson(this);

}
@JsonSerializable()
class RegisterAResponse extends BaseResponse {
  @JsonKey(name:"data")
  RegisterResponse? registerResponse;
  RegisterAResponse(this.registerResponse); // from json
  factory RegisterAResponse.fromJson(Map<String,dynamic>json)=>
      _$RegisterAResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$RegisterAResponseToJson(this);

}
@JsonSerializable()
class ProfileResponse  extends BaseResponse{
  @JsonKey(name:"data")
  UserResponse? userResponse;
  ProfileResponse(this.userResponse);

  // from json
  factory ProfileResponse.fromJson(Map<String,dynamic>json)=>
      _$ProfileResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$ProfileResponseToJson(this);

}

@JsonSerializable()
class UniversitiesDataResponse  {
  @JsonKey(name:"data")
  List<DataResponse>? dataResponse;
  @JsonKey(name:"current_page")
  int? current_page;
  @JsonKey(name:"from")
  int? from;
  @JsonKey(name:"last_page")
  int? last_page;
  @JsonKey(name:"first_page_url")
  String? first_page_url;
  @JsonKey(name:"last_page_url")
  String? last_page_url;
  @JsonKey(name:"next_page_url")
  String? next_page_url;
  @JsonKey(name:"path")
  String? path;
  @JsonKey(name:"prev_page_url")
  String? prev_page_url;
  @JsonKey(name:"per_page")
  int? per_page;
  @JsonKey(name:"to")
  int? to;
  @JsonKey(name:"total")
  int? total;
  @JsonKey(name:"links")
  List<LinkResponse>? links;

  UniversitiesDataResponse(
      this.current_page,
      this.from,
      this.last_page,
      this.dataResponse,
      this.first_page_url,
      this.last_page_url,
      this.next_page_url,
      this.path,
      this.prev_page_url,
      this.per_page,
      this.to,
      this.total,
      this.links); // from json
  factory UniversitiesDataResponse.fromJson(Map<String,dynamic>json)=>
      _$UniversitiesDataResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$UniversitiesDataResponseToJson(this);

}

@JsonSerializable()
class LinkResponse {

  @JsonKey(name:"url")
  String? url;
  @JsonKey(name:"label")
  String? label;
  @JsonKey(name:"active")
  bool? active;


  LinkResponse(this.url, this.label, this.active); // from json
  factory LinkResponse.fromJson(Map<String,dynamic>json)=>
      _$LinkResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$LinkResponseToJson(this);

}

@JsonSerializable()
class UniversitiesResponse  extends BaseResponse{

  @JsonKey(name:"data")
  UniversitiesDataResponse? dataResponse;

  UniversitiesResponse(this.dataResponse);
  // from json
  factory UniversitiesResponse.fromJson(Map<String,dynamic>json)=>
      _$UniversitiesResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$UniversitiesResponseToJson(this);

}
@JsonSerializable()
class DataSubscriptionResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "daysNumber")
  String? daysNumber;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "name")
  String? name;


  DataSubscriptionResponse(this.id, this.daysNumber, this.price,this.name);

  factory DataSubscriptionResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataSubscriptionResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataSubscriptionResponseToJson(this);

}
@JsonSerializable()
class SubscriptionsResponse  extends BaseResponse{
  @JsonKey(name:"data")
  List<DataSubscriptionResponse>? subscriptionResponse;

  SubscriptionsResponse(this.subscriptionResponse);

  // from json
  factory SubscriptionsResponse.fromJson(Map<String,dynamic>json)=>
      _$SubscriptionsResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$SubscriptionsResponseToJson(this);

}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "shortcut")
  String? shortcut;

  DataResponse(this.id, this.name, this.shortcut); //from json

  factory DataResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataResponseToJson(this);

}

@JsonSerializable()
class DataTransportationLinesResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "from")
  FromResponse? from;

  @JsonKey(name: "to")
  ToResponse? to;

  DataTransportationLinesResponse(this.id, this.name, this.from, this.to);

  factory DataTransportationLinesResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataTransportationLinesResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataTransportationLinesResponseToJson(this);

}
@JsonSerializable()
class PivotLineResponse {
  @JsonKey(name: "transportation_line_id")
  String? transportation_line_id;
  @JsonKey(name: "transfer_position_id")
  String? transfer_position_id;


  PivotLineResponse(this.transportation_line_id, this.transfer_position_id);

  factory PivotLineResponse.fromJson(Map<String,dynamic> json ) =>
      _$PivotLineResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PivotLineResponseToJson(this);

}
@JsonSerializable()
class FromResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  FromResponse(this.id, this.name);

  factory FromResponse.fromJson(Map<String,dynamic> json ) =>
      _$FromResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$FromResponseToJson(this);

}
@JsonSerializable()
class ToResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  ToResponse(this.id, this.name);

  factory ToResponse.fromJson(Map<String,dynamic> json ) =>
      _$ToResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ToResponseToJson(this);

}

////////////////////////
@JsonSerializable()
class PositionLineResponse  extends BaseResponse{
  @JsonKey(name:"data")
  List<FromResponse>? positionLineResponse;

  PositionLineResponse(this.positionLineResponse);

  // from json
  factory PositionLineResponse.fromJson(Map<String,dynamic>json)=>
      _$PositionLineResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$PositionLineResponseToJson(this);

}
@JsonSerializable()
class TransportationLinesDataResponse {
  @JsonKey(name:"current_page")
  int? current_page;
  @JsonKey(name:"from")
  int? from;
  @JsonKey(name:"last_page")
  int? last_page;
  @JsonKey(name:"first_page_url")
  String? first_page_url;
  @JsonKey(name:"last_page_url")
  String? last_page_url;
  @JsonKey(name:"next_page_url")
  String? next_page_url;
  @JsonKey(name:"path")
  String? path;
  @JsonKey(name:"prev_page_url")
  String? prev_page_url;
  @JsonKey(name:"per_page")
  int? per_page;
  @JsonKey(name:"to")
  int? to;
  @JsonKey(name:"total")
  int? total;
  @JsonKey(name:"links")
  List<LinkResponse>? links;
  @JsonKey(name:"data")
  List<DataTransportationLinesResponse>? dataTransportationLinesResponse;


  TransportationLinesDataResponse(
      this.current_page,
      this.from,
      this.last_page,
      this.first_page_url,
      this.last_page_url,
      this.next_page_url,
      this.path,
      this.prev_page_url,
      this.per_page,
      this.to,
      this.total,
      this.links,
      this.dataTransportationLinesResponse); // from json
  factory TransportationLinesDataResponse.fromJson(Map<String,dynamic>json)=>
      _$TransportationLinesDataResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$TransportationLinesDataResponseToJson(this);

}

@JsonSerializable()
class TransportationLinesResponse  extends BaseResponse{
  @JsonKey(name:"data")
  TransportationLinesDataResponse? transportationLinesDataResponse;

  TransportationLinesResponse(this.transportationLinesDataResponse);

  // from json
  factory TransportationLinesResponse.fromJson(Map<String,dynamic>json)=>
      _$TransportationLinesResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$TransportationLinesResponseToJson(this);

}


@JsonSerializable()
class DataTransferPositionsResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;


  DataTransferPositionsResponse(this.id, this.name);

  factory DataTransferPositionsResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataTransferPositionsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataTransferPositionsResponseToJson(this);

}



@JsonSerializable()
class TransferPositionsDataMainResponse  {
  @JsonKey(name:"data")
  List<DataTransferPositionsResponse>? transferPositionsDataResponse;
  @JsonKey(name:"current_page")
  int? current_page;
  @JsonKey(name:"first_page_url")
  String? first_page_url;
  @JsonKey(name:"from")
  int? from;
  @JsonKey(name:"last_page")
  int? last_page;
  @JsonKey(name:"last_page_url")
  String? last_page_url;

  @JsonKey(name:"next_page_url")
  String? next_page_url;
  @JsonKey(name:"path")
  String? path;
  @JsonKey(name:"prev_page_url")
  String? prev_page_url;
  @JsonKey(name:"per_page")
  int? per_page;
  @JsonKey(name:"to")
  int? to;
  @JsonKey(name:"total")
  int? total;
  @JsonKey(name:"links")
  List<LinkResponse>? links;

  TransferPositionsDataMainResponse(
      this.transferPositionsDataResponse,
      this.current_page,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.next_page_url,
      this.path,
      this.prev_page_url,
      this.per_page,
      this.to,
      this.total,
      this.links); // from json
  factory TransferPositionsDataMainResponse.fromJson(Map<String,dynamic>json)=>
      _$TransferPositionsDataMainResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$TransferPositionsDataMainResponseToJson(this);

}



@JsonSerializable()
class TransferPositionsResponse  extends BaseResponse{
  @JsonKey(name:"data")
  TransferPositionsDataMainResponse? transferPositionsDataMainResponse;

  TransferPositionsResponse(this.transferPositionsDataMainResponse);

  factory TransferPositionsResponse.fromJson(Map<String,dynamic>json)=>
      _$TransferPositionsResponseFromJson(json);

  // to json
  Map<String,dynamic>toJson()=>
      _$TransferPositionsResponseToJson(this);

}

@JsonSerializable()
class DataDayResponse {

  @JsonKey(name: "name")
  String? name;


  DataDayResponse (this.name);

  factory DataDayResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataDayResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataDayResponseToJson(this);

}

@JsonSerializable()
class DayProgramResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "day")
  DataDayResponse? day;
  @JsonKey(name: "transfer_position")
  DataTransferPositionsResponse? transfer_position;
  @JsonKey(name: "start")
  String? start;
  @JsonKey(name: "end")
  String? end;
  @JsonKey(name: "confirmAttendance1")
  String? confirmAttendance1;
  @JsonKey(name: "confirmAttendance2")
  String? confirmAttendance2;


  DayProgramResponse(this.day, this.transfer_position, this.start, this.end,
      this.confirmAttendance1, this.confirmAttendance2);

  factory DayProgramResponse.fromJson(Map<String,dynamic> json ) =>
      _$DayProgramResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DayProgramResponseToJson(this);

}
@JsonSerializable()
class ProgramResponse extends BaseResponse{
  @JsonKey(name: "data")
  List<DayProgramResponse>? dayProgramResponse;


  ProgramResponse(this.dayProgramResponse);

  factory ProgramResponse.fromJson(Map<String,dynamic> json ) =>
      _$ProgramResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ProgramResponseToJson(this);

}

@JsonSerializable()
class BusDriverResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "bus_id")
  int? bus_id;
  @JsonKey(name: "driver_id")
  int? driver_id;
  @JsonKey(name: "bus")
  BusResponse? bus;


  BusDriverResponse(this.id, this.bus_id, this.driver_id, this.bus);

  factory BusDriverResponse.fromJson(Map<String,dynamic> json ) =>
      _$BusDriverResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$BusDriverResponseToJson(this);

}

@JsonSerializable()
class BusResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name: "capacity")
  int? capacity;
  @JsonKey(name: "details")
  String? details;
  @JsonKey(name: "image")
  String? image;


  BusResponse(this.id, this.key, this.capacity, this.details, this.image);

  factory BusResponse.fromJson(Map<String,dynamic> json ) =>
      _$BusResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$BusResponseToJson(this);

}
@JsonSerializable()
class TripResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "supervisor_id")
  int? supervisor_id;
  @JsonKey(name: "bus_driver_id")
  int? bus_driver_id;
  @JsonKey(name: "time_id")
  int? time_id;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "created_at")
  String? created_at;
  @JsonKey(name: "updated_at")
  String? updated_at;
  @JsonKey(name: "availableSeats")
  int? availableSeats;
  @JsonKey(name: "bus_driver")
  BusDriverResponse? bus_driver;
  TripResponse(
      this.id,
      this.supervisor_id,
      this.bus_driver_id,
      this.time_id,
      this.status,
      this.created_at,
      this.updated_at,
      this.availableSeats,
      this.bus_driver);

  factory TripResponse.fromJson(Map<String,dynamic> json ) =>
      _$TripResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$TripResponseToJson(this);

}

@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: "amount")
  String? amount;
  @JsonKey(name: "date")
  String? date;


  PaymentResponse(this.amount, this.date);

  factory PaymentResponse.fromJson(Map<String,dynamic> json ) =>
      _$PaymentResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PaymentResponseToJson(this);

}
@JsonSerializable()
class PaymentsResponse {
  @JsonKey(name: "payments")
List<PaymentResponse>? paymentResponse;

  PaymentsResponse(this.paymentResponse);

  factory PaymentsResponse.fromJson(Map<String,dynamic> json ) =>
      _$PaymentsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$PaymentsResponseToJson(this);

}

@JsonSerializable()
class DataConfirmStudentResponse {

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? user_id;
  @JsonKey(name: "day_id")
  int? day_id;
  @JsonKey(name: "transfer_position_id")
  int? transfer_position_id;
  @JsonKey(name: "start")
  String? start;
  @JsonKey(name: "end")
  String? end;
  @JsonKey(name: "confirmAttendance1")
  bool? confirmAttendance1;
  @JsonKey(name: "confirmAttendance2")
  int? confirmAttendance2;

  DataConfirmStudentResponse(
      this.id,
      this.user_id,
      this.day_id,
      this.transfer_position_id,
      this.start,
      this.end,
      this.confirmAttendance1,
      this.confirmAttendance2);

  factory DataConfirmStudentResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataConfirmStudentResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataConfirmStudentResponseToJson(this);

}
@JsonSerializable()
class ConfirmStudentResponse extends BaseResponse{
  @JsonKey(name: "data")
  DataConfirmStudentResponse? dataConfirmStudentResponse;

  ConfirmStudentResponse(this.dataConfirmStudentResponse);

  factory ConfirmStudentResponse.fromJson(Map<String,dynamic> json ) =>
      _$ConfirmStudentResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ConfirmStudentResponseToJson(this);

}

@JsonSerializable()
class UserLAFResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "expiredSubscriptionDate")
  String? expiredSubscriptionDate;

  @JsonKey(name: "subscription")
  DataSubscription1Response? subscription;
  @JsonKey(name: "line")
  DataLineResponse? line;
  @JsonKey(name: "position")
  DataTransferPositionsResponse? position;
  @JsonKey(name: "location")
  Location1DataResponse? location;
  @JsonKey(name: "university")
  DataUnResponse? university;
  @JsonKey(name: "payments")
  List<PaymentResponse>? paymentResponse;
  @JsonKey(name: "programs")
  List<DayProgramResponse>? programs;


  UserLAFResponse(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.expiredSubscriptionDate,
      this.subscription,
      this.line,
      this.position,
      this.location,
      this.university,
      this.paymentResponse,
      this.programs);

  factory UserLAFResponse.fromJson(Map<String,dynamic> json ) =>
      _$UserLAFResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UserLAFResponseToJson(this);

}
@JsonSerializable()
class DataSubscription1Response {

  @JsonKey(name: "daysNumber")
  String? daysNumber;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "name")
  String? name;


  DataSubscription1Response(this.daysNumber, this.price,this.name);

  factory DataSubscription1Response.fromJson(Map<String,dynamic> json ) =>
      _$DataSubscription1ResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataSubscription1ResponseToJson(this);

}
@JsonSerializable()
class DataLineResponse {

  @JsonKey(name: "name")
  String? name;

  DataLineResponse(this.name);

  factory DataLineResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataLineResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataLineResponseToJson(this);

}
@JsonSerializable()
class DataUnResponse {

  @JsonKey(name: "name")
  String? name;

  DataUnResponse(this.name);

  factory DataUnResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataUnResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataUnResponseToJson(this);

}
@JsonSerializable()
class City1Response {

  @JsonKey(name: "name")
  String? name;

  City1Response(this.name);

  factory City1Response.fromJson(Map<String,dynamic> json ) =>
      _$City1ResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$City1ResponseToJson(this);

}

@JsonSerializable()
class Location1DataResponse {

  @JsonKey(name: "city")
  City1Response? cityResponse;
  @JsonKey(name: "area")
  AreaResponse? areaResponse;
  @JsonKey(name: "street")
  String? street;


  Location1DataResponse(this.cityResponse, this.areaResponse, this.street);

  factory Location1DataResponse.fromJson(Map<String,dynamic> json ) =>
      _$Location1DataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$Location1DataResponseToJson(this);

}