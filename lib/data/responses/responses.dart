
import 'package:json_annotation/json_annotation.dart';
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
class SupervisorRequest  {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? area_id;
  int? city_id;
  String? street;
  SupervisorRequest(
      {
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.city_id,
        this.area_id,
        this.street
      }
      );//from json
  factory SupervisorRequest.fromJson(Map<String,dynamic> json ) =>
      _$SupervisorRequestFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$SupervisorRequestToJson(this);

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
class UniversityResponse  {
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"name")
  String? name;

  UniversityResponse(this.id, this.name); //from json
  factory UniversityResponse.fromJson(Map<String,dynamic> json ) =>
      _$UniversityResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UniversityResponseToJson(this);

}

@JsonSerializable()
class DataProfileResponse {
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
  @JsonKey(name: "line")
  DataTransportationLinesResponse? line;
  @JsonKey(name: "position")
  DataTransferPositionsResponse? position;
  @JsonKey(name: "location")
  LocationDataResponse? location;
  @JsonKey(name: "university")
  UniversityResponse? university;
  @JsonKey(name: "subscription")
  DataSubscriptionResponse? subscription;

  DataProfileResponse(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.expiredSubscriptionDate,
      this.line,
      this.position,
      this.location,
      this.university,
      this.subscription);

  factory DataProfileResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataProfileResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataProfileResponseToJson(this);

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
  DataProfileResponse? userResponse;
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
////// TODO ///////////////////////////////////////////////////////////////////////////////////////////////////////////
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
  @JsonKey(name: "lng")
  String? lng;
  @JsonKey(name: "lat")
  String? lat;
  FromResponse(this.id, this.name,this.lng,this.lat);

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
  @JsonKey(name: "lng")
  String? lng;
  @JsonKey(name: "lat")
  String? lat;
  ToResponse(this.id, this.name,this.lng,this.lat);

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
  List<DataTransferPositionsResponse>? positionLineResponse;

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
  @JsonKey(name:"meta")
  MetaResponse? meta;

  @JsonKey(name:"links")
  LinksLAFResponse? links;
  @JsonKey(name:"data")
  List<DataTransportationLinesResponse>? dataTransportationLinesResponse;
  TransportationLinesDataResponse(
      this.dataTransportationLinesResponse,this.links,this.meta); // from json
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
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "lng")
  String? lng;
  DataTransferPositionsResponse(this.id, this.name,this.lng,this.lat);

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
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  DataDayResponse (this.id,this.name);
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
  @JsonKey(name: "line")
  List<String>? line;
  @JsonKey(name: "end")
  String? end;
  @JsonKey(name: "confirmAttendance1")
  bool? confirmAttendance1;
  @JsonKey(name: "confirmAttendance2")
  bool? confirmAttendance2;


  DayProgramResponse(this.id,this.day, this.transfer_position,this.line, this.start, this.end,
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
class BusResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name: "capacity")
  String? capacity;
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
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "availableSeats")
  int? availableSeats;
  TripResponse(
      this.id,
      this.status,
      this.availableSeats,
);

  factory TripResponse.fromJson(Map<String,dynamic> json ) =>
      _$TripResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$TripResponseToJson(this);

}

@JsonSerializable()
class Trip1Response {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "availableSeats")
  int? availableSeats;
  Trip1Response(
      this.id,
      this.availableSeats,
      );

  factory Trip1Response.fromJson(Map<String,dynamic> json ) =>
      _$Trip1ResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$Trip1ResponseToJson(this);

}

/////////////////Lost and found get all
@JsonSerializable()
class LostAndFoundDataResponse{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "trip")
  TripResponse? trip;
  @JsonKey(name: "user")
  UserLAFResponse? user;


  LostAndFoundDataResponse(
      this.id, this.description, this.image, this.trip, this.user);

  factory LostAndFoundDataResponse.fromJson(Map<String,dynamic> json ) =>
      _$LostAndFoundDataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LostAndFoundDataResponseToJson(this);

}

@JsonSerializable()
class LinksLAFResponse {

  @JsonKey(name: "first")
  String? first;
  @JsonKey(name: "last")
  String? last;
  @JsonKey(name: "prev")
  String? prev;
  @JsonKey(name: "next")
  String? next;


  LinksLAFResponse(this.first, this.last, this.prev, this.next);

  factory LinksLAFResponse.fromJson(Map<String,dynamic> json ) =>
      _$LinksLAFResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LinksLAFResponseToJson(this);

}
@JsonSerializable()
class MetaResponse {

  @JsonKey(name: "current_page")
  int? current_page;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? last_page;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? per_page;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "links")
  List<LinkResponse>? links;

  MetaResponse(this.current_page, this.from, this.last_page, this.path,
      this.per_page, this.to, this.total, this.links);

  factory MetaResponse.fromJson(Map<String,dynamic> json ) =>
      _$MetaResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$MetaResponseToJson(this);

}
@JsonSerializable()
class LostAndFoundsResponse{
  @JsonKey(name: "data")
  List<LostAndFoundDataResponse>? lostAndFoundDataResponse;
  @JsonKey(name: "meta")
  MetaResponse? meta;
  @JsonKey(name: "links")
  LinksLAFResponse? links;
  LostAndFoundsResponse(
      this.lostAndFoundDataResponse, this.meta, this.links);

  factory LostAndFoundsResponse.fromJson(Map<String,dynamic> json ) =>
      _$LostAndFoundsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LostAndFoundsResponseToJson(this);
 }
@JsonSerializable()
class LostAndFoundResponse extends BaseResponse{
  @JsonKey(name: "data")
  LostAndFoundsResponse? data;

  LostAndFoundResponse(this.data);
  factory LostAndFoundResponse.fromJson(Map<String,dynamic> json ) =>
      _$LostAndFoundResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LostAndFoundResponseToJson(this);

}
////////////Store Lost and found

@JsonSerializable()
class LostFoundStoreResponse {
  @JsonKey(name: "data")
  LostFoundResponse? data;

  LostFoundStoreResponse(this.data);

  factory LostFoundStoreResponse.fromJson(Map<String,dynamic> json ) =>
      _$LostFoundStoreResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LostFoundStoreResponseToJson(this);

}
@JsonSerializable()
class LostFoundResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;


  LostFoundResponse(this.id,this.description, this.image);

  factory LostFoundResponse.fromJson(Map<String,dynamic> json ) =>
      _$LostFoundResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LostFoundResponseToJson(this);

}
@JsonSerializable()
class StoreLostFoundResponse extends BaseResponse{
  @JsonKey(name: "data")
  LostFoundResponse? lostFoundResponse;
  StoreLostFoundResponse(this.lostFoundResponse);

  factory StoreLostFoundResponse.fromJson(Map<String,dynamic> json ) =>
      _$StoreLostFoundResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$StoreLostFoundResponseToJson(this);

}
///////////////payment/////////////
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


  UserLAFResponse(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.expiredSubscriptionDate,
    );

  factory UserLAFResponse.fromJson(Map<String,dynamic> json ) =>
      _$UserLAFResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$UserLAFResponseToJson(this);

}

@JsonSerializable()
class ClaimsDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "trip")
  TripResponse? trip;
  @JsonKey(name: "user")
  UserLAFResponse? user;
  @JsonKey(name: "description")
  String? description;


  ClaimsDataResponse(this.id, this.trip, this.user, this.description);

  factory ClaimsDataResponse.fromJson(Map<String,dynamic> json ) =>
      _$ClaimsDataResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ClaimsDataResponseToJson(this);

}


@JsonSerializable()
class ClaimsResponse extends BaseResponse{
  @JsonKey(name: "data")
  ClaimsDataResponse? claimsDataResponse;

  ClaimsResponse(this.claimsDataResponse);

  factory ClaimsResponse.fromJson(Map<String,dynamic> json ) =>
      _$ClaimsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ClaimsResponseToJson(this);

}


@JsonSerializable()
class ForgetPasswordResponse extends BaseResponse{
  @JsonKey(name: "data")


  ForgetPasswordResponse();

  factory ForgetPasswordResponse.fromJson(Map<String,dynamic> json ) =>
      _$ForgetPasswordResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$ForgetPasswordResponseToJson(this);

}

@JsonSerializable()
class HomeSupervisorResponse extends BaseResponse{
  @JsonKey(name: "data")
  DataHomeSupervisorResponse? dataHomeSupervisor;

  HomeSupervisorResponse(this.dataHomeSupervisor);

  factory HomeSupervisorResponse.fromJson(Map<String,dynamic> json ) =>
      _$HomeSupervisorResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$HomeSupervisorResponseToJson(this);

}
@JsonSerializable()
class DataHomeSupervisorResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "time")
  TimeResponse? time;
  @JsonKey(name: "availableSeats")
  int? availableSeats;
  @JsonKey(name: "transferPositions")
  List<DataTransferPositionsResponse>? transferPositions;
  @JsonKey(name: "lines")
  List<LineResponse>? lines;
  @JsonKey(name: "users")
  List<UserLAFResponse>? users;


  DataHomeSupervisorResponse(this.id, this.time, this.availableSeats,
      this.transferPositions, this.lines, this.users);

  factory DataHomeSupervisorResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataHomeSupervisorResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataHomeSupervisorResponseToJson(this);

}
@JsonSerializable()
class TimeResponse {
  @JsonKey(name: "id")
  int ?id;
  @JsonKey(name: "start")
  String? start;
  @JsonKey(name: "date")
  String?date;


  TimeResponse(this.id, this.start, this.date);

  factory TimeResponse.fromJson(Map<String,dynamic> json ) =>
      _$TimeResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$TimeResponseToJson(this);

}
@JsonSerializable()
class LineResponse {
  @JsonKey(name: "name")
  String? name;


  LineResponse(this.name);

  factory LineResponse.fromJson(Map<String,dynamic> json ) =>
      _$LineResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$LineResponseToJson(this);

}

@JsonSerializable()
class DataEvaluationResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserLAFResponse? user;
  @JsonKey(name: "trip")
  Trip1Response? trip;
  @JsonKey(name: "review")
  String? review;


  DataEvaluationResponse(this.id, this.user, this.trip, this.review);

  factory DataEvaluationResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataEvaluationResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataEvaluationResponseToJson(this);

}

@JsonSerializable()
class EvaluationResponse extends BaseResponse {
  @JsonKey(name: "data")
  DataEvaluationResponse? evaluationResponse;

  EvaluationResponse(this.evaluationResponse);

  factory EvaluationResponse.fromJson(Map<String,dynamic> json ) =>
      _$EvaluationResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$EvaluationResponseToJson(this);

}
@JsonSerializable()
class DriverResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "firstname")
  String? firstname;
  @JsonKey(name: "lastname")
  String? lastname;
  @JsonKey(name: "number")
  String? number;


  DriverResponse(this.id, this.firstname, this.lastname, this.number);

  factory DriverResponse.fromJson(Map<String,dynamic> json ) =>
      _$DriverResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DriverResponseToJson(this);

}

@JsonSerializable()
class BusDriverResponse  {
  @JsonKey(name: "bus")
  BusResponse? bus;
  @JsonKey(name: "driver")
  DriverResponse? driver;

  BusDriverResponse(this.bus,this.driver);

  factory BusDriverResponse.fromJson(Map<String,dynamic> json ) =>
      _$BusDriverResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$BusDriverResponseToJson(this);

}

@JsonSerializable()
class DataTripsResponse  {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "busDriver")
  BusDriverResponse? busDriver;
  @JsonKey(name: "time")
  TimeResponse? time;
  @JsonKey(name: "availableSeats")
  int? availableSeats;

  DataTripsResponse(this.id, this.busDriver, this.time, this.availableSeats);

  factory DataTripsResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataTripsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataTripsResponseToJson(this);

}

@JsonSerializable()
class TripsResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<DataTripsResponse>? dataTrips;

  TripsResponse(this.dataTrips);

  factory TripsResponse.fromJson(Map<String,dynamic> json ) =>
      _$TripsResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$TripsResponseToJson(this);

}
@JsonSerializable()
class DataUpdateSupervisorResponse {
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
  @JsonKey(name: "location")
  LocationDataResponse? locationResponse;


  DataUpdateSupervisorResponse(this.id, this.firstName, this.lastName,
      this.email, this.phoneNumber, this.image, this.expiredSubscriptionDate,
      this.locationResponse);

  factory DataUpdateSupervisorResponse.fromJson(Map<String,dynamic> json ) =>
      _$DataUpdateSupervisorResponseFromJson(json);

//to json
  Map<String,dynamic> toJson()=>
      _$DataUpdateSupervisorResponseToJson(this);

}
@JsonSerializable()
class UpdateSupervisorResponse extends BaseResponse {
  @JsonKey(name:"data")
  DataUpdateSupervisorResponse? updateSupervisorResponse;

  UpdateSupervisorResponse(this.updateSupervisorResponse);
  // from json
  factory UpdateSupervisorResponse.fromJson(Map<String,dynamic>json)=>
      _$UpdateSupervisorResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$UpdateSupervisorResponseToJson(this);

}
@JsonSerializable()
class AcceptAndDenyResponse extends BaseResponse {
  @JsonKey(name:"data")
  DataDailyReservationResponse? dailyReservationResponse;

  AcceptAndDenyResponse(this.dailyReservationResponse);
  // from json
  factory AcceptAndDenyResponse.fromJson(Map<String,dynamic>json)=>
      _$AcceptAndDenyResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$AcceptAndDenyResponseToJson(this);

}

@JsonSerializable()
class DataDailyReservationResponse {
 // @JsonKey(name:"position")
 // DataTransferPositionsResponse? position;
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"phoneNumber")
  String? phoneNumber;
  @JsonKey(name:"seatsNumber")
  String? seatsNumber;


  DataDailyReservationResponse(this.id, this.name,
      this.phoneNumber, this.seatsNumber); // from json
  factory DataDailyReservationResponse.fromJson(Map<String,dynamic>json)=>
      _$DataDailyReservationResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$DataDailyReservationResponseToJson(this);
}
@JsonSerializable()
class DailyReservationResponse  extends BaseResponse {
  @JsonKey(name:"data")
  List<DataDailyReservationResponse>? dailyReservation;
  DailyReservationResponse(this.dailyReservation);
  // from json
  factory DailyReservationResponse.fromJson(Map<String,dynamic>json)=>
      _$DailyReservationResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$DailyReservationResponseToJson(this);

}


@JsonSerializable()
class QrConfirmResponse  extends BaseResponse {
  @JsonKey(name:"data")
  dynamic data;
  QrConfirmResponse(this.data);
  // from json
  factory QrConfirmResponse.fromJson(Map<String,dynamic>json)=>
      _$QrConfirmResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$QrConfirmResponseToJson(this);

}
@JsonSerializable()
class NotificationReadDataResponse {
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"user_id")
  int? userId;
  @JsonKey(name:"title")
  String? title;
  @JsonKey(name:"body")
  String? body;
  @JsonKey(name:"is_read")
  String? isRead;
  @JsonKey(name:"created_at")
  String? created_at;
  @JsonKey(name:"updated_at")
  String? updated_at;


  NotificationReadDataResponse(this.id, this.userId, this.title, this.body,
      this.isRead, this.created_at, this.updated_at);

  factory NotificationReadDataResponse.fromJson(Map<String,dynamic>json)=>
      _$NotificationReadDataResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$NotificationReadDataResponseToJson(this);
}

@JsonSerializable()
class NotificationReadResponse  extends BaseResponse {
  @JsonKey(name:"data")
  NotificationReadDataResponse? data;
  NotificationReadResponse(this.data);
  // from json
  factory NotificationReadResponse.fromJson(Map<String,dynamic>json)=>
      _$NotificationReadResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$NotificationReadResponseToJson(this);

}

@JsonSerializable()
class NotificationDataResponse {
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"title")
  String? title;
  @JsonKey(name:"type")
  String? type;
  @JsonKey(name:"body")
  String? body;
  @JsonKey(name:"is_read")
  String? isRead;


  NotificationDataResponse(this.id, this.title, this.type, this.body, this.isRead);

  factory NotificationDataResponse.fromJson(Map<String,dynamic>json)=>
      _$NotificationDataResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$NotificationDataResponseToJson(this);
}

@JsonSerializable()
class NotificationResponse  extends BaseResponse {
  @JsonKey(name:"data")
  List<NotificationDataResponse>? data;
  NotificationResponse(this.data);
  // from json
  factory NotificationResponse.fromJson(Map<String,dynamic>json)=>
      _$NotificationResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$NotificationResponseToJson(this);

}
@JsonSerializable()
class UpdatePositionResponse  extends BaseResponse {
  @JsonKey(name:"data")
  dynamic data;
  UpdatePositionResponse(this.data);
  // from json
  factory UpdatePositionResponse.fromJson(Map<String,dynamic>json)=>
      _$UpdatePositionResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$UpdatePositionResponseToJson(this);

}
@JsonSerializable()
class Position   {
  double lat;
  double lng;
  Position(this.lng,this.lat); // from json
  factory Position.fromJson(Map<String,dynamic>json)=>
      _$PositionFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$PositionToJson(this);

}
@JsonSerializable()
class StudentPositionResponse  extends BaseResponse {
  @JsonKey(name:"data")
List<UserLAFResponse> users;
  StudentPositionResponse(this.users); // from json
  factory StudentPositionResponse.fromJson(Map<String,dynamic>json)=>
      _$StudentPositionResponseFromJson(json);
  // to json
  Map<String,dynamic>toJson()=>
      _$StudentPositionResponseToJson(this);

}