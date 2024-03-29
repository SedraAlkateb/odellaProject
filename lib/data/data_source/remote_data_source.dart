
import 'package:untitled/data/network/app_api.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';

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
  Future<ClaimsResponse> storeClaim(ClaimRequest claimRequest);
  Future<StoreLostFoundResponse> storeLostFound(DescriptionRequest descriptionRequest);
  Future<LostAndFoundResponse> getAllLostFound();
  Future<ForgetPasswordResponse> forgetPassword(String email);
  Future<ForgetPasswordResponse> resetPassword(RestPasswordRequest restPasswordRequest);
  Future<HomeSupervisorResponse> homeSupervisor(String time);
  Future<EvaluationResponse> evaluation(EvaluationRequest evaluationRequest );
  Future<TripsResponse> weeklyTrips();
  Future<UpdateSupervisorResponse> updateSuperVisor(UpdataSupervisorRequest supervisorRequest);
  Future<UpdateSupervisorResponse> updateSupervisprPassword(UpdatePasswordRequest  updatePasswordRequest);
  Future<UpdateSupervisorResponse> updateSupervisorImage(UpdateImage  updateImage);
  Future<DailyReservationResponse> dailyReservations(int id);
  Future<QrConfirmResponse> confirmStudentByQrCode(ConfirmQrRequest confirmQrRequest);
  Future<AcceptAndDenyResponse> approve(int id);
  Future<AcceptAndDenyResponse> deny(int id);
  Future<AuthenticationResponse> refresh();
  Future<NotificationResponse> notification();
  Future<UpdatePositionResponse> supervisorPositionUpdate(PositionMap PositionMap);
  Future<NotificationReadResponse> makeReadNotification(int id);
  Future<UpdatePositionResponse> readAllNot();
  Future<StudentPositionResponse> studentPosition(int trip,int position);
  Future<UserDailyReservationResponse> userDailyReservations(DailyReservationRequest dailyReservationRequest);
  Future<TodayTripsResponse> todayTrips(String time);
  Future<BasePhoneResponse> phone(int phone);
  Future<AlgorithmResponse> algorithm(Map<String, dynamic> requestBody);

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
      loginRequest.fcmtoken,
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
        confirmAttendance1: confirmStudent.confirmAttendance1,
        confirmAttendance2: confirmStudent.confirmAttendance2

    );
  }

  @override
  Future<LostAndFoundResponse> getAllLostFound() async {
    return await _appServiceClient.getAlllostFound();
  }

  @override
  Future<ClaimsResponse> storeClaim(ClaimRequest claimRequest) async {
    return await _appServiceClient.claim(
      claimRequest.trip_id,
      claimRequest.description,

    );
  }

  @override
  Future<StoreLostFoundResponse> storeLostFound(
      DescriptionRequest descriptionRequest) async {
    return await _appServiceClient.lostFound(
      descriptionRequest.trip_id,
      descriptionRequest.description,
      image: descriptionRequest.image,

    );
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) async {
    return await _appServiceClient.forgetPassword(email);
  }

  @override
  Future<ForgetPasswordResponse> resetPassword(
      RestPasswordRequest restPasswordRequest) async {
    return await _appServiceClient.ResetPassword(
      restPasswordRequest.email,
      restPasswordRequest.code,
      restPasswordRequest.newPassword
    );
  }

  @override
  Future<HomeSupervisorResponse> homeSupervisor(String time)async {
  return await _appServiceClient.homeSupervisor(time);
  }

  @override
  Future<EvaluationResponse> evaluation(EvaluationRequest evaluationRequest) async{
    return await _appServiceClient.evaluation(
        evaluationRequest.tripId,
    evaluationRequest.review
    );

  }

  @override
  Future<TripsResponse> weeklyTrips() async{
   return await _appServiceClient.weeklyTrips();
  }

  @override
  Future<UpdateSupervisorResponse> updateSuperVisor(UpdataSupervisorRequest supervisorRequest) async{
return await _appServiceClient.updateSuperVisor(supervisorRequest.supervisorId, SupervisorRequest(
  phoneNumber: supervisorRequest.phoneNumber,
  lastName: supervisorRequest.lastName,
  firstName: supervisorRequest.firstName,
  city_id: supervisorRequest.cityId,
  area_id: supervisorRequest.areaId,
street: supervisorRequest.street
));
  }

  @override
  Future<UpdateSupervisorResponse> updateSupervisprPassword (UpdatePasswordRequest updatePasswordRequest) async {
  return await _appServiceClient.updatePasswordSupervisor(
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
  Future<UpdateSupervisorResponse> updateSupervisorImage(UpdateImage updateImage) async {
    return await _appServiceClient.updateImageSupervisor(
        updateImage.studentId,
        updateImage.image
    );
  }

  @override
  Future<DailyReservationResponse> dailyReservations(int id) async{
  return await _appServiceClient.dailyReservations(id);
  }

  @override
  Future<QrConfirmResponse> confirmStudentByQrCode(ConfirmQrRequest confirmQrRequest) async{
    return await _appServiceClient.confirmStudentByQrCode(confirmQrRequest.userId,confirmQrRequest.tripID);
  }

  @override
  Future<AcceptAndDenyResponse> approve(int id) async{
    return await _appServiceClient.approve(id);
  }

  @override
  Future<AcceptAndDenyResponse> deny(int id) async{
    return await _appServiceClient.deny(id);
  }

  @override
  Future<AuthenticationResponse> refresh()  async{
    return await _appServiceClient.refresh();
  }

  @override
  Future<NotificationResponse> notification() async{
    return await _appServiceClient.notification();
  }

  @override
  Future<UpdatePositionResponse> supervisorPositionUpdate(PositionMap PositionMap) async{
    return await _appServiceClient.supervisorPositionUpdate(PositionMap.tripId, PositionMap.lng, PositionMap.lat);
  }

  @override
  Future<NotificationReadResponse> makeReadNotification(int id)async{
    return await _appServiceClient.makeReadNotification(id);
  }
  @override
  Future<UpdatePositionResponse> readAllNot() async{
    return await _appServiceClient.readAllNot();
  }

  @override
  Future<StudentPositionResponse> studentPosition(int trip, int position) async{
    return await _appServiceClient.studentPosition(trip, position);

  }

  @override
  Future<UserDailyReservationResponse> userDailyReservations(DailyReservationRequest dailyReservationRequest) async{
    return await _appServiceClient.
    userDailyReservations
      (
        dailyReservationRequest.trip,
        dailyReservationRequest.name,
        dailyReservationRequest.phoneNumber,
        dailyReservationRequest.transfer_position_id,
        dailyReservationRequest.seatsNumber,
        dailyReservationRequest.fcm_token);

  }

  @override
  Future<TodayTripsResponse> todayTrips(String time)
  async{
    return await _appServiceClient.todayTrips(time);

  }

  @override
  Future<BasePhoneResponse> phone(int phone)
  async{
    return await _appServiceClient.getNumber(phone);

  }



  @override
  Future<AlgorithmResponse> algorithm(Map<String, dynamic> requestBody )
  async{
    return await _appServiceClient.algorithm(
    requestBody
    );

  }

}
