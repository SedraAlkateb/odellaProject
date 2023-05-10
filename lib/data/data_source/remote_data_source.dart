
import 'package:untitled/data/network/app_api.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/data/responses/responses.dart';

abstract class RemoteDataSource{
  Future<PostResponse > posts();
  Future<AuthenticationResponse > login(LoginRequest loginRequest);
  Future<UniversitiesResponse> getUniversities();
  Future<TransferPositionsResponse>getTransferPositions();
  Future<TransportationLinesResponse>getTransportationLines();
  Future<SubscriptionsResponse>getSubscriptions();
  Future<ProfileResponse>profile();
  Future<PositionLineResponse>positionLine(int id);
  Future<RegisterAResponse>register(SignUpRequest signUpRequest);
  Future<UpdateStResponse>updateStudent(UpdateStudentRequest updateStudentRequest);
  Future<UpdateStResponse>updateStudentt(UpdateStudentRequest updateStudentRequest);
  Future<AreasResponse>getAreasByCityId(int id);
  Future<CitiesResponse>getCities();
  Future<LocationsResponse>getLocationById(int id);
  Future<LogOutResponse>logout();
  Future<UpdateStResponse> updatePassword(UpdatePasswordRequest  updatePasswordRequest);
  Future<UpdateStResponse> updateImage(UpdateImage  updateImage);
  Future<ProgramResponse> programs();
  Future<ConfirmStudentResponse> confirmStudentAttendenceInTrip(ConfirmStudent confirmStudent);

}

class RemoteDataSourceImpl implements RemoteDataSource {

  AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<PostResponse> posts() async
  {
    return await _appServiceClient.posts();
  }

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password
    );
  }

  @override
  Future<UniversitiesResponse> getUniversities() async {
    return await _appServiceClient.getUniversities();
  }

  @override
  Future<SubscriptionsResponse> getSubscriptions() async {
    return await _appServiceClient.getSubscriptions();
  }

  @override
  Future<TransferPositionsResponse> getTransferPositions() async {
    return await _appServiceClient.getTransferPositions();
  }

  @override
  Future<TransportationLinesResponse> getTransportationLines() async {
    return await _appServiceClient.getTransportationLines();
  }

  @override
  Future<ProfileResponse> profile() async {
    return await _appServiceClient.profile();
  }

  @override
  Future<PositionLineResponse> positionLine(int id) async {
    return await _appServiceClient.positionLine(id);
  }

  @override
  Future<RegisterAResponse> register(SignUpRequest signUpRequest) async {
    return await _appServiceClient.register(
      signUpRequest.city_id,
      signUpRequest.area_id,
      signUpRequest.street,
      signUpRequest.subscription_id
      ,
      signUpRequest.firstName,
      signUpRequest.lastName,
      signUpRequest.email,
      signUpRequest.password,
      signUpRequest.phoneNumber,
      signUpRequest.transportation_line_id,
      signUpRequest.transfer_position_id,
      signUpRequest.university_id,
      image: signUpRequest.image,

    );
  }

  @override
  Future<UpdateStResponse> updateStudent(
      UpdateStudentRequest updateStudentRequest) async {
    return await _appServiceClient.updateStudent(
        updateStudentRequest.studentId,
        city_id: updateStudentRequest.city_id,
        area_id: updateStudentRequest.area_id,
        street: updateStudentRequest.street,
        subscription_id: updateStudentRequest.subscription_id,
        firstName: updateStudentRequest.firstName,
        lastName: updateStudentRequest.lastName,
        // oldPassword: updateStudentRequest.oldPassword, newPassword:updateStudentRequest.newPassword,
        //newPassword_confirmation:  updateStudentRequest.newPassword_confirmation,
        phoneNumber: updateStudentRequest.phoneNumber,
        transportation_line_id: updateStudentRequest.transportation_line_id,
        transfer_position_id: updateStudentRequest.transfer_position_id,
        image: updateStudentRequest.image,
        university_id: updateStudentRequest.university_id);
  }

  Future<UpdateStResponse> updateStudentt(
      UpdateStudentRequest updateStudentRequest) async {
    return await _appServiceClient.updateStudentt(
        updateStudentRequest.studentId,
        StudentRequest(
            city_id: updateStudentRequest.city_id,
            area_id: updateStudentRequest.area_id,
            street: updateStudentRequest.street,
            subscription_id: updateStudentRequest.subscription_id,
            firstName: updateStudentRequest.firstName,
            lastName: updateStudentRequest.lastName,
            phoneNumber: updateStudentRequest.phoneNumber,
            transportation_line_id: updateStudentRequest.transportation_line_id,
            transfer_position_id: updateStudentRequest.transfer_position_id,
            university_id: updateStudentRequest.university_id

        )
    );
  }

  @override
  Future<AreasResponse> getAreasByCityId(int cityId) async {
    return await _appServiceClient.getAreaByIdCity(cityId);
  }

  @override
  Future<CitiesResponse> getCities() async {
    return await _appServiceClient.getCities();
  }

  @override
  Future<LocationsResponse> getLocationById(int id) async {
    return await _appServiceClient.getLocationsById(id);
  }

  @override
  Future<LogOutResponse> logout() async {
    return await _appServiceClient.logout();
  }

  @override
  Future<UpdateStResponse> updatePassword(
      UpdatePasswordRequest updatePasswordRequest) async {
    return await _appServiceClient.updatePassword(
        updatePasswordRequest.studentId,
        PasswordRequest(
            oldPassword: updatePasswordRequest.oldPassword,
            newPassword: updatePasswordRequest.newPassword,
            newPassword_confirmation: updatePasswordRequest
                .newPassword_confirmation

        )
    );
  }

  @override
  Future<UpdateStResponse> updateImage(UpdateImage updateImage) async {
    return await _appServiceClient.updateImage(
        updateImage.studentId,
        updateImage.image
    );
  }

  @override
  Future<ProgramResponse> programs() async {
    return await _appServiceClient.programs();
  }

  @override
  Future<ConfirmStudentResponse> confirmStudentAttendenceInTrip(
      ConfirmStudent confirmStudent) async {
    return await _appServiceClient.confirmStudentAttendenceInTrip(
        confirmStudent.studentId,
        confirmAttendance1: confirmStudent.confirmAttendance1
    );
  }

}
