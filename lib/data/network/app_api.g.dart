// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://yaamen1.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PostResponse> posts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PostResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/posts/1',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationResponse> login(
    email,
    password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthenticationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterAResponse> register(
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
    university_id, {
    image,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'city_id',
      city_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'area_id',
      area_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'street',
      street,
    ));
    _data.fields.add(MapEntry(
      'subscription_id',
      subscription_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'firstName',
      firstName,
    ));
    _data.fields.add(MapEntry(
      'lastName',
      lastName,
    ));
    _data.fields.add(MapEntry(
      'email',
      email,
    ));
    _data.fields.add(MapEntry(
      'password',
      password,
    ));
    _data.fields.add(MapEntry(
      'phoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'transportation_line_id',
      transportation_line_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'transfer_position_id',
      transfer_position_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'university_id',
      university_id.toString(),
    ));
    if (image != null) {
      _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterAResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/auth/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterAResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UniversitiesResponse> getUniversities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UniversitiesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/universities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UniversitiesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransferPositionsResponse> getTransferPositions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransferPositionsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/transferPositions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransferPositionsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TransportationLinesResponse> getTransportationLines() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransportationLinesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/transportationLines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransportationLinesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubscriptionsResponse> getSubscriptions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubscriptionsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/subscriptions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubscriptionsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileResponse> profile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProfileResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/auth/profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PositionLineResponse> positionLine(lineId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PositionLineResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/transferPositions/transportationLines/${lineId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PositionLineResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CitiesResponse> getCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CitiesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/cities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CitiesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AreasResponse> getAreaByIdCity(cityId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AreasResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/areas/cities/${cityId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AreasResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LocationsResponse> getLocationsById(locationId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LocationsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/locations/${locationId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LocationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateStResponse> updateStudent(
    studentId, {
    city_id,
    area_id,
    street,
    subscription_id,
    firstName,
    lastName,
    oldPassword,
    newPassword,
    newPassword_confirmation,
    phoneNumber,
    transportation_line_id,
    transfer_position_id,
    image,
    university_id,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (city_id != null) {
      _data.fields.add(MapEntry(
        'city_id',
        city_id.toString(),
      ));
    }
    if (area_id != null) {
      _data.fields.add(MapEntry(
        'area_id',
        area_id.toString(),
      ));
    }
    if (street != null) {
      _data.fields.add(MapEntry(
        'street',
        street,
      ));
    }
    if (subscription_id != null) {
      _data.fields.add(MapEntry(
        'subscription_id',
        subscription_id,
      ));
    }
    if (firstName != null) {
      _data.fields.add(MapEntry(
        'firstName',
        firstName,
      ));
    }
    if (lastName != null) {
      _data.fields.add(MapEntry(
        'lastName',
        lastName,
      ));
    }
    if (oldPassword != null) {
      _data.fields.add(MapEntry(
        'oldPassword',
        oldPassword,
      ));
    }
    if (newPassword != null) {
      _data.fields.add(MapEntry(
        'newPassword',
        newPassword,
      ));
    }
    if (newPassword_confirmation != null) {
      _data.fields.add(MapEntry(
        'newPassword_confirmation',
        newPassword_confirmation,
      ));
    }
    if (phoneNumber != null) {
      _data.fields.add(MapEntry(
        'phoneNumber',
        phoneNumber,
      ));
    }
    if (transportation_line_id != null) {
      _data.fields.add(MapEntry(
        'transportation_line_id',
        transportation_line_id,
      ));
    }
    if (transfer_position_id != null) {
      _data.fields.add(MapEntry(
        'transfer_position_id',
        transfer_position_id,
      ));
    }
    if (image != null) {
      _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
          contentType: MediaType.parse('image/jpeg'),
        ),
      ));
    }
    if (university_id != null) {
      _data.fields.add(MapEntry(
        'university_id',
        university_id,
      ));
    }
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateStResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/students/${studentId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateStResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateStResponse> updateStudentt(
    studentId,
    studentRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(studentRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateStResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/api/students/${studentId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateStResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateStResponse> updatePassword(
    studentId,
    passwordRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(passwordRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateStResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/api/students/${studentId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateStResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateStResponse> updateImage(
    studentId,
    image,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpdateStResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/students/${studentId}?_method=PUT',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateStResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LogOutResponse> logout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LogOutResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/auth/logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LogOutResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProgramResponse> programs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProgramResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/programs',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProgramResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ConfirmStudentResponse> confirmStudentAttendenceInTrip(
    studentId, {
    confirmAttendance1,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'confirmAttendance1': confirmAttendance1};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConfirmStudentResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/student/programs/${studentId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfirmStudentResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
