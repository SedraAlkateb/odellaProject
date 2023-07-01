// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..massage = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
    };

LogOutResponse _$LogOutResponseFromJson(Map<String, dynamic> json) =>
    LogOutResponse(
      json['data'] as List<dynamic>,
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$LogOutResponseToJson(LogOutResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      json['userId'] as int?,
      json['id'] as int?,
      json['title'] as String?,
      json['body'] as String?,
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

StudentRequest _$StudentRequestFromJson(Map<String, dynamic> json) =>
    StudentRequest(
      city_id: json['city_id'] as int?,
      area_id: json['area_id'] as int?,
      street: json['street'] as String?,
      subscription_id: json['subscription_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      transportation_line_id: json['transportation_line_id'] as String?,
      transfer_position_id: json['transfer_position_id'] as String?,
      university_id: json['university_id'] as String?,
    );

Map<String, dynamic> _$StudentRequestToJson(StudentRequest instance) =>
    <String, dynamic>{
      'city_id': instance.city_id,
      'area_id': instance.area_id,
      'street': instance.street,
      'subscription_id': instance.subscription_id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'transportation_line_id': instance.transportation_line_id,
      'transfer_position_id': instance.transfer_position_id,
      'university_id': instance.university_id,
    };

SupervisorRequest _$SupervisorRequestFromJson(Map<String, dynamic> json) =>
    SupervisorRequest(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      city_id: json['city_id'] as int?,
      area_id: json['area_id'] as int?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$SupervisorRequestToJson(SupervisorRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'area_id': instance.area_id,
      'city_id': instance.city_id,
      'street': instance.street,
    };

PasswordRequest _$PasswordRequestFromJson(Map<String, dynamic> json) =>
    PasswordRequest(
      newPassword_confirmation: json['newPassword_confirmation'] as String?,
      newPassword: json['newPassword'] as String?,
      oldPassword: json['oldPassword'] as String?,
    );

Map<String, dynamic> _$PasswordRequestToJson(PasswordRequest instance) =>
    <String, dynamic>{
      'newPassword_confirmation': instance.newPassword_confirmation,
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['access_token'] as String?,
      json['token_type'] as String?,
      json['expires_in'] as int?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'user': instance.userResponse,
    };

UniversityResponse _$UniversityResponseFromJson(Map<String, dynamic> json) =>
    UniversityResponse(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$UniversityResponseToJson(UniversityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DataProfileResponse _$DataProfileResponseFromJson(Map<String, dynamic> json) =>
    DataProfileResponse(
      json['id'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['expiredSubscriptionDate'] as String?,
      json['line'] == null
          ? null
          : DataTransportationLinesResponse.fromJson(
              json['line'] as Map<String, dynamic>),
      json['position'] == null
          ? null
          : DataTransferPositionsResponse.fromJson(
              json['position'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : LocationDataResponse.fromJson(
              json['location'] as Map<String, dynamic>),
      json['university'] == null
          ? null
          : UniversityResponse.fromJson(
              json['university'] as Map<String, dynamic>),
      json['subscription'] == null
          ? null
          : DataSubscriptionResponse.fromJson(
              json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProfileResponseToJson(
        DataProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'expiredSubscriptionDate': instance.expiredSubscriptionDate,
      'line': instance.line,
      'position': instance.position,
      'location': instance.location,
      'university': instance.university,
      'subscription': instance.subscription,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int?,
      json['location_id'] as String?,
      json['subscription_id'] as String?,
      json['transportation_line_id'] as String?,
      json['transfer_position_id'] as String?,
      json['university_id'] as String?,
      json['status'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['email_verified_at'] as String?,
      (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..fcm_token = json['fcm_token'] as String?;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.location_id,
      'subscription_id': instance.subscription_id,
      'transportation_line_id': instance.transportation_line_id,
      'transfer_position_id': instance.transfer_position_id,
      'university_id': instance.university_id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'email_verified_at': instance.email_verified_at,
      'status': instance.status,
      'fcm_token': instance.fcm_token,
      'roles': instance.roles,
    };

UpdateStudentResponse _$UpdateStudentResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateStudentResponse(
      json['id'] as int?,
      json['location_id'] as String?,
      json['subscription_id'] as String?,
      json['expiredSubscriptionDate'] as String?,
      json['transportation_line_id'] as String?,
      json['transfer_position_id'] as String?,
      json['university_id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['email_verified_at'] as String?,
      json['status'] as String?,
      json['fcm_token'] as String?,
      json['location'] == null
          ? null
          : LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateStudentResponseToJson(
        UpdateStudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.location_id,
      'subscription_id': instance.subscription_id,
      'expiredSubscriptionDate': instance.expiredSubscriptionDate,
      'transportation_line_id': instance.transportation_line_id,
      'transfer_position_id': instance.transfer_position_id,
      'university_id': instance.university_id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'email_verified_at': instance.email_verified_at,
      'status': instance.status,
      'fcm_token': instance.fcm_token,
      'location': instance.locationResponse,
    };

UpdateStResponse _$UpdateStResponseFromJson(Map<String, dynamic> json) =>
    UpdateStResponse(
      json['data'] == null
          ? null
          : UpdateStudentResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$UpdateStResponseToJson(UpdateStResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.updateStudentResponse,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      json['id'] as int?,
      json['location_id'] as int?,
      json['subscription_id'] as String?,
      json['transportation_line_id'] as String?,
      json['transfer_position_id'] as String?,
      json['university_id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.location_id,
      'subscription_id': instance.subscription_id,
      'transportation_line_id': instance.transportation_line_id,
      'transfer_position_id': instance.transfer_position_id,
      'university_id': instance.university_id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'roles': instance.roles,
    };

RoleResponse _$RoleResponseFromJson(Map<String, dynamic> json) => RoleResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['guard_name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['pivot'] == null
          ? null
          : PivotResponse.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoleResponseToJson(RoleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'guard_name': instance.guard_name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'pivot': instance.pivot,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      json['id'] as int?,
      json['city_id'] as String?,
      json['area_id'] as String?,
      json['street'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city_id': instance.city_id,
      'area_id': instance.area_id,
      'street': instance.street,
    };

LocationDataResponse _$LocationDataResponseFromJson(
        Map<String, dynamic> json) =>
    LocationDataResponse(
      json['city'] == null
          ? null
          : CityResponse.fromJson(json['city'] as Map<String, dynamic>),
      json['area'] == null
          ? null
          : AreaResponse.fromJson(json['area'] as Map<String, dynamic>),
      json['street'] as String?,
    );

Map<String, dynamic> _$LocationDataResponseToJson(
        LocationDataResponse instance) =>
    <String, dynamic>{
      'city': instance.cityResponse,
      'area': instance.areaResponse,
      'street': instance.street,
    };

LocationsResponse _$LocationsResponseFromJson(Map<String, dynamic> json) =>
    LocationsResponse(
      json['data'] == null
          ? null
          : LocationDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$LocationsResponseToJson(LocationsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.locationDataResponse,
    };

CitiesDataResponse _$CitiesDataResponseFromJson(Map<String, dynamic> json) =>
    CitiesDataResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => CityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['current_page'] as int?,
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['prev_page_url'] as String?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesDataResponseToJson(CitiesDataResponse instance) =>
    <String, dynamic>{
      'data': instance.cityResponse,
      'current_page': instance.current_page,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'prev_page_url': instance.prev_page_url,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.cityId,
      'name': instance.name,
    };

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      json['data'] == null
          ? null
          : CitiesDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.citiesDataResponse,
    };

AreasResponse _$AreasResponseFromJson(Map<String, dynamic> json) =>
    AreasResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => AreaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$AreasResponseToJson(AreasResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.areaResponse,
    };

AreaResponse _$AreaResponseFromJson(Map<String, dynamic> json) => AreaResponse(
      json['name'] as String?,
      json['id'] as int?,
    );

Map<String, dynamic> _$AreaResponseToJson(AreaResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

PivotResponse _$PivotResponseFromJson(Map<String, dynamic> json) =>
    PivotResponse(
      json['model_id'] as String?,
      json['role_id'] as String?,
      json['model_type'] as String?,
    );

Map<String, dynamic> _$PivotResponseToJson(PivotResponse instance) =>
    <String, dynamic>{
      'model_id': instance.model_id,
      'role_id': instance.role_id,
      'model_type': instance.model_type,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dataUserResponse,
    };

RegisterAResponse _$RegisterAResponseFromJson(Map<String, dynamic> json) =>
    RegisterAResponse(
      json['data'] == null
          ? null
          : RegisterResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$RegisterAResponseToJson(RegisterAResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.registerResponse,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['data'] == null
          ? null
          : DataProfileResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.userResponse,
    };

UniversitiesDataResponse _$UniversitiesDataResponseFromJson(
        Map<String, dynamic> json) =>
    UniversitiesDataResponse(
      json['current_page'] as int?,
      json['from'] as int?,
      json['last_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['prev_page_url'] as String?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UniversitiesDataResponseToJson(
        UniversitiesDataResponse instance) =>
    <String, dynamic>{
      'data': instance.dataResponse,
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'first_page_url': instance.first_page_url,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'prev_page_url': instance.prev_page_url,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };

LinkResponse _$LinkResponseFromJson(Map<String, dynamic> json) => LinkResponse(
      json['url'] as String?,
      json['label'] as String?,
      json['active'] as bool?,
    );

Map<String, dynamic> _$LinkResponseToJson(LinkResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

UniversitiesResponse _$UniversitiesResponseFromJson(
        Map<String, dynamic> json) =>
    UniversitiesResponse(
      json['data'] == null
          ? null
          : UniversitiesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$UniversitiesResponseToJson(
        UniversitiesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dataResponse,
    };

DataSubscriptionResponse _$DataSubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    DataSubscriptionResponse(
      json['id'] as int?,
      json['daysNumber'] as String?,
      json['price'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DataSubscriptionResponseToJson(
        DataSubscriptionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'daysNumber': instance.daysNumber,
      'price': instance.price,
      'name': instance.name,
    };

SubscriptionsResponse _$SubscriptionsResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataSubscriptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$SubscriptionsResponseToJson(
        SubscriptionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.subscriptionResponse,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['shortcut'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortcut': instance.shortcut,
    };

DataTransportationLinesResponse _$DataTransportationLinesResponseFromJson(
        Map<String, dynamic> json) =>
    DataTransportationLinesResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['from'] == null
          ? null
          : FromResponse.fromJson(json['from'] as Map<String, dynamic>),
      json['to'] == null
          ? null
          : ToResponse.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataTransportationLinesResponseToJson(
        DataTransportationLinesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'from': instance.from,
      'to': instance.to,
    };

PivotLineResponse _$PivotLineResponseFromJson(Map<String, dynamic> json) =>
    PivotLineResponse(
      json['transportation_line_id'] as String?,
      json['transfer_position_id'] as String?,
    );

Map<String, dynamic> _$PivotLineResponseToJson(PivotLineResponse instance) =>
    <String, dynamic>{
      'transportation_line_id': instance.transportation_line_id,
      'transfer_position_id': instance.transfer_position_id,
    };

FromResponse _$FromResponseFromJson(Map<String, dynamic> json) => FromResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['lng'] as String?,
      json['lat'] as String?,
    );

Map<String, dynamic> _$FromResponseToJson(FromResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lng': instance.lng,
      'lat': instance.lat,
    };

ToResponse _$ToResponseFromJson(Map<String, dynamic> json) => ToResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['lng'] as String?,
      json['lat'] as String?,
    );

Map<String, dynamic> _$ToResponseToJson(ToResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lng': instance.lng,
      'lat': instance.lat,
    };

PositionLineResponse _$PositionLineResponseFromJson(
        Map<String, dynamic> json) =>
    PositionLineResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataTransferPositionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$PositionLineResponseToJson(
        PositionLineResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.positionLineResponse,
    };

TransportationLinesDataResponse _$TransportationLinesDataResponseFromJson(
        Map<String, dynamic> json) =>
    TransportationLinesDataResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DataTransportationLinesResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['links'] == null
          ? null
          : LinksLAFResponse.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransportationLinesDataResponseToJson(
        TransportationLinesDataResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'links': instance.links,
      'data': instance.dataTransportationLinesResponse,
    };

TransportationLinesResponse _$TransportationLinesResponseFromJson(
        Map<String, dynamic> json) =>
    TransportationLinesResponse(
      json['data'] == null
          ? null
          : TransportationLinesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$TransportationLinesResponseToJson(
        TransportationLinesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.transportationLinesDataResponse,
    };

DataTransferPositionsResponse _$DataTransferPositionsResponseFromJson(
        Map<String, dynamic> json) =>
    DataTransferPositionsResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['lng'] as String?,
      json['lat'] as String?,
    );

Map<String, dynamic> _$DataTransferPositionsResponseToJson(
        DataTransferPositionsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };

TransferPositionsDataMainResponse _$TransferPositionsDataMainResponseFromJson(
        Map<String, dynamic> json) =>
    TransferPositionsDataMainResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataTransferPositionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['current_page'] as int?,
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['next_page_url'] as String?,
      json['path'] as String?,
      json['prev_page_url'] as String?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransferPositionsDataMainResponseToJson(
        TransferPositionsDataMainResponse instance) =>
    <String, dynamic>{
      'data': instance.transferPositionsDataResponse,
      'current_page': instance.current_page,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'prev_page_url': instance.prev_page_url,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };

TransferPositionsResponse _$TransferPositionsResponseFromJson(
        Map<String, dynamic> json) =>
    TransferPositionsResponse(
      json['data'] == null
          ? null
          : TransferPositionsDataMainResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$TransferPositionsResponseToJson(
        TransferPositionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.transferPositionsDataMainResponse,
    };

DataDayResponse _$DataDayResponseFromJson(Map<String, dynamic> json) =>
    DataDayResponse(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DataDayResponseToJson(DataDayResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

DayProgramResponse _$DayProgramResponseFromJson(Map<String, dynamic> json) =>
    DayProgramResponse(
      json['id'] as int?,
      json['day'] == null
          ? null
          : DataDayResponse.fromJson(json['day'] as Map<String, dynamic>),
      json['transfer_position'] == null
          ? null
          : DataTransferPositionsResponse.fromJson(
              json['transfer_position'] as Map<String, dynamic>),
      (json['line'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['start'] as String?,
      json['end'] as String?,
      json['confirmAttendance1'] as bool?,
      json['confirmAttendance2'] as bool?,
    );

Map<String, dynamic> _$DayProgramResponseToJson(DayProgramResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'transfer_position': instance.transfer_position,
      'start': instance.start,
      'line': instance.line,
      'end': instance.end,
      'confirmAttendance1': instance.confirmAttendance1,
      'confirmAttendance2': instance.confirmAttendance2,
    };

ProgramResponse _$ProgramResponseFromJson(Map<String, dynamic> json) =>
    ProgramResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DayProgramResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$ProgramResponseToJson(ProgramResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dayProgramResponse,
    };

BusResponse _$BusResponseFromJson(Map<String, dynamic> json) => BusResponse(
      json['id'] as int?,
      json['key'] as String?,
      json['capacity'] as String?,
      json['details'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$BusResponseToJson(BusResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'capacity': instance.capacity,
      'details': instance.details,
      'image': instance.image,
    };

TripResponse _$TripResponseFromJson(Map<String, dynamic> json) => TripResponse(
      json['id'] as int?,
      json['status'] as String?,
      json['availableSeats'] as int?,
    );

Map<String, dynamic> _$TripResponseToJson(TripResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'availableSeats': instance.availableSeats,
    };

Trip1Response _$Trip1ResponseFromJson(Map<String, dynamic> json) =>
    Trip1Response(
      json['id'] as int?,
      json['availableSeats'] as int?,
    );

Map<String, dynamic> _$Trip1ResponseToJson(Trip1Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'availableSeats': instance.availableSeats,
    };

LostAndFoundDataResponse _$LostAndFoundDataResponseFromJson(
        Map<String, dynamic> json) =>
    LostAndFoundDataResponse(
      json['id'] as int?,
      json['description'] as String?,
      json['image'] as String?,
      json['trip'] == null
          ? null
          : TripResponse.fromJson(json['trip'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : UserLAFResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LostAndFoundDataResponseToJson(
        LostAndFoundDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'trip': instance.trip,
      'user': instance.user,
    };

LinksLAFResponse _$LinksLAFResponseFromJson(Map<String, dynamic> json) =>
    LinksLAFResponse(
      json['first'] as String?,
      json['last'] as String?,
      json['prev'] as String?,
      json['next'] as String?,
    );

Map<String, dynamic> _$LinksLAFResponseToJson(LinksLAFResponse instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      json['current_page'] as int?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['path'] as String?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };

LostAndFoundsResponse _$LostAndFoundsResponseFromJson(
        Map<String, dynamic> json) =>
    LostAndFoundsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              LostAndFoundDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : MetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
      json['links'] == null
          ? null
          : LinksLAFResponse.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LostAndFoundsResponseToJson(
        LostAndFoundsResponse instance) =>
    <String, dynamic>{
      'data': instance.lostAndFoundDataResponse,
      'meta': instance.meta,
      'links': instance.links,
    };

LostAndFoundResponse _$LostAndFoundResponseFromJson(
        Map<String, dynamic> json) =>
    LostAndFoundResponse(
      json['data'] == null
          ? null
          : LostAndFoundsResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$LostAndFoundResponseToJson(
        LostAndFoundResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

LostFoundStoreResponse _$LostFoundStoreResponseFromJson(
        Map<String, dynamic> json) =>
    LostFoundStoreResponse(
      json['data'] == null
          ? null
          : LostFoundResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LostFoundStoreResponseToJson(
        LostFoundStoreResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LostFoundResponse _$LostFoundResponseFromJson(Map<String, dynamic> json) =>
    LostFoundResponse(
      json['id'] as int?,
      json['description'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$LostFoundResponseToJson(LostFoundResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
    };

StoreLostFoundResponse _$StoreLostFoundResponseFromJson(
        Map<String, dynamic> json) =>
    StoreLostFoundResponse(
      json['data'] == null
          ? null
          : LostFoundResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$StoreLostFoundResponseToJson(
        StoreLostFoundResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.lostFoundResponse,
    };

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      json['amount'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date,
    };

PaymentsResponse _$PaymentsResponseFromJson(Map<String, dynamic> json) =>
    PaymentsResponse(
      (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentsResponseToJson(PaymentsResponse instance) =>
    <String, dynamic>{
      'payments': instance.paymentResponse,
    };

DataConfirmStudentResponse _$DataConfirmStudentResponseFromJson(
        Map<String, dynamic> json) =>
    DataConfirmStudentResponse(
      json['id'] as int?,
      json['user_id'] as int?,
      json['day_id'] as int?,
      json['transfer_position_id'] as int?,
      json['start'] as String?,
      json['end'] as String?,
      json['confirmAttendance1'] as bool?,
      json['confirmAttendance2'] as int?,
    );

Map<String, dynamic> _$DataConfirmStudentResponseToJson(
        DataConfirmStudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'day_id': instance.day_id,
      'transfer_position_id': instance.transfer_position_id,
      'start': instance.start,
      'end': instance.end,
      'confirmAttendance1': instance.confirmAttendance1,
      'confirmAttendance2': instance.confirmAttendance2,
    };

ConfirmStudentResponse _$ConfirmStudentResponseFromJson(
        Map<String, dynamic> json) =>
    ConfirmStudentResponse(
      json['data'] == null
          ? null
          : DataConfirmStudentResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$ConfirmStudentResponseToJson(
        ConfirmStudentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dataConfirmStudentResponse,
    };

UserLAFResponse _$UserLAFResponseFromJson(Map<String, dynamic> json) =>
    UserLAFResponse(
      json['id'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['expiredSubscriptionDate'] as String?,
    );

Map<String, dynamic> _$UserLAFResponseToJson(UserLAFResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'expiredSubscriptionDate': instance.expiredSubscriptionDate,
    };

ClaimsDataResponse _$ClaimsDataResponseFromJson(Map<String, dynamic> json) =>
    ClaimsDataResponse(
      json['id'] as int?,
      json['trip'] == null
          ? null
          : TripResponse.fromJson(json['trip'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : UserLAFResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['description'] as String?,
    );

Map<String, dynamic> _$ClaimsDataResponseToJson(ClaimsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trip': instance.trip,
      'user': instance.user,
      'description': instance.description,
    };

ClaimsResponse _$ClaimsResponseFromJson(Map<String, dynamic> json) =>
    ClaimsResponse(
      json['data'] == null
          ? null
          : ClaimsDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$ClaimsResponseToJson(ClaimsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.claimsDataResponse,
    };

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse()
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
    };

HomeSupervisorResponse _$HomeSupervisorResponseFromJson(
        Map<String, dynamic> json) =>
    HomeSupervisorResponse(
      json['data'] == null
          ? null
          : DataHomeSupervisorResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$HomeSupervisorResponseToJson(
        HomeSupervisorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dataHomeSupervisor,
    };

DataHomeSupervisorResponse _$DataHomeSupervisorResponseFromJson(
        Map<String, dynamic> json) =>
    DataHomeSupervisorResponse(
      json['id'] as int?,
      json['time'] == null
          ? null
          : TimeResponse.fromJson(json['time'] as Map<String, dynamic>),
      json['availableSeats'] as int?,
      (json['transferPositions'] as List<dynamic>?)
          ?.map((e) =>
              DataTransferPositionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['lines'] as List<dynamic>?)
          ?.map((e) => LineResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserLAFResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHomeSupervisorResponseToJson(
        DataHomeSupervisorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'availableSeats': instance.availableSeats,
      'transferPositions': instance.transferPositions,
      'lines': instance.lines,
      'users': instance.users,
    };

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) => TimeResponse(
      json['id'] as int?,
      json['start'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$TimeResponseToJson(TimeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'date': instance.date,
    };

LineResponse _$LineResponseFromJson(Map<String, dynamic> json) => LineResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$LineResponseToJson(LineResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

DataEvaluationResponse _$DataEvaluationResponseFromJson(
        Map<String, dynamic> json) =>
    DataEvaluationResponse(
      json['id'] as int?,
      json['user'] == null
          ? null
          : UserLAFResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['trip'] == null
          ? null
          : Trip1Response.fromJson(json['trip'] as Map<String, dynamic>),
      review: json['review'] as String?,
    );

Map<String, dynamic> _$DataEvaluationResponseToJson(
        DataEvaluationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'trip': instance.trip,
      'review': instance.review,
    };

EvaluationResponse _$EvaluationResponseFromJson(Map<String, dynamic> json) =>
    EvaluationResponse(
      json['data'] == null
          ? null
          : DataEvaluationResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$EvaluationResponseToJson(EvaluationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.evaluationResponse,
    };

DriverResponse _$DriverResponseFromJson(Map<String, dynamic> json) =>
    DriverResponse(
      json['id'] as int?,
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['number'] as String?,
    );

Map<String, dynamic> _$DriverResponseToJson(DriverResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'number': instance.number,
    };

BusDriverResponse _$BusDriverResponseFromJson(Map<String, dynamic> json) =>
    BusDriverResponse(
      json['bus'] == null
          ? null
          : BusResponse.fromJson(json['bus'] as Map<String, dynamic>),
      json['driver'] == null
          ? null
          : DriverResponse.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusDriverResponseToJson(BusDriverResponse instance) =>
    <String, dynamic>{
      'bus': instance.bus,
      'driver': instance.driver,
    };

DataTripsResponse _$DataTripsResponseFromJson(Map<String, dynamic> json) =>
    DataTripsResponse(
      json['id'] as int?,
      json['busDriver'] == null
          ? null
          : BusDriverResponse.fromJson(
              json['busDriver'] as Map<String, dynamic>),
      json['time'] == null
          ? null
          : TimeResponse.fromJson(json['time'] as Map<String, dynamic>),
      json['availableSeats'] as int?,
    );

Map<String, dynamic> _$DataTripsResponseToJson(DataTripsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'busDriver': instance.busDriver,
      'time': instance.time,
      'availableSeats': instance.availableSeats,
    };

DataTripsWeekResponse _$DataTripsWeekResponseFromJson(
        Map<String, dynamic> json) =>
    DataTripsWeekResponse(
      (json['trips'] as List<dynamic>?)
          ?.map((e) => DataTripsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluations: (json['evaluations'] as List<dynamic>?)
          ?.map(
              (e) => EvaluationInfoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataTripsWeekResponseToJson(
        DataTripsWeekResponse instance) =>
    <String, dynamic>{
      'trips': instance.trips,
      'evaluations': instance.evaluations,
    };

TripsResponse _$TripsResponseFromJson(Map<String, dynamic> json) =>
    TripsResponse(
      json['data'] == null
          ? null
          : DataTripsWeekResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$TripsResponseToJson(TripsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.trips,
    };

DataUpdateSupervisorResponse _$DataUpdateSupervisorResponseFromJson(
        Map<String, dynamic> json) =>
    DataUpdateSupervisorResponse(
      json['id'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['image'] as String?,
      json['expiredSubscriptionDate'] as String?,
      json['location'] == null
          ? null
          : LocationDataResponse.fromJson(
              json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUpdateSupervisorResponseToJson(
        DataUpdateSupervisorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'image': instance.image,
      'expiredSubscriptionDate': instance.expiredSubscriptionDate,
      'location': instance.locationResponse,
    };

UpdateSupervisorResponse _$UpdateSupervisorResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateSupervisorResponse(
      json['data'] == null
          ? null
          : DataUpdateSupervisorResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$UpdateSupervisorResponseToJson(
        UpdateSupervisorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.updateSupervisorResponse,
    };

AcceptAndDenyResponse _$AcceptAndDenyResponseFromJson(
        Map<String, dynamic> json) =>
    AcceptAndDenyResponse(
      json['data'] == null
          ? null
          : DataDailyReservationResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$AcceptAndDenyResponseToJson(
        AcceptAndDenyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dailyReservationResponse,
    };

DataDailyReservationResponse _$DataDailyReservationResponseFromJson(
        Map<String, dynamic> json) =>
    DataDailyReservationResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['phoneNumber'] as String?,
      json['seatsNumber'] as String?,
    );

Map<String, dynamic> _$DataDailyReservationResponseToJson(
        DataDailyReservationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'seatsNumber': instance.seatsNumber,
    };

DailyReservationResponse _$DailyReservationResponseFromJson(
        Map<String, dynamic> json) =>
    DailyReservationResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataDailyReservationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$DailyReservationResponseToJson(
        DailyReservationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.dailyReservation,
    };

QrConfirmResponse _$QrConfirmResponseFromJson(Map<String, dynamic> json) =>
    QrConfirmResponse(
      json['data'],
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$QrConfirmResponseToJson(QrConfirmResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

NotificationReadDataResponse _$NotificationReadDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationReadDataResponse(
      json['id'] as int?,
      json['user_id'] as int?,
      json['title'] as String?,
      json['body'] as String?,
      json['is_read'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
    );

Map<String, dynamic> _$NotificationReadDataResponseToJson(
        NotificationReadDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

NotificationReadResponse _$NotificationReadResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationReadResponse(
      json['data'] == null
          ? null
          : NotificationReadDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$NotificationReadResponseToJson(
        NotificationReadResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['type'] as String?,
      json['body'] as String?,
      json['is_read'] as String?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'body': instance.body,
      'is_read': instance.isRead,
    };

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

UpdatePositionResponse _$UpdatePositionResponseFromJson(
        Map<String, dynamic> json) =>
    UpdatePositionResponse(
      json['data'],
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$UpdatePositionResponseToJson(
        UpdatePositionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.data,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      (json['lng'] as num).toDouble(),
      (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

StudentPositionResponse _$StudentPositionResponseFromJson(
        Map<String, dynamic> json) =>
    StudentPositionResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => UserLAFResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..massage = json['message'] as String?;

Map<String, dynamic> _$StudentPositionResponseToJson(
        StudentPositionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.massage,
      'data': instance.users,
    };

TripEvaluationResponse _$TripEvaluationResponseFromJson(
        Map<String, dynamic> json) =>
    TripEvaluationResponse(
      json['id'] as int?,
      json['availableSeats'] as int?,
    );

Map<String, dynamic> _$TripEvaluationResponseToJson(
        TripEvaluationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'availableSeats': instance.availableSeats,
    };

EvaluationInfoResponse _$EvaluationInfoResponseFromJson(
        Map<String, dynamic> json) =>
    EvaluationInfoResponse(
      json['id'] as int?,
      json['review'] as String?,
      json['trip'] == null
          ? null
          : TripEvaluationResponse.fromJson(
              json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvaluationInfoResponseToJson(
        EvaluationInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'review': instance.review,
      'trip': instance.trip,
    };
