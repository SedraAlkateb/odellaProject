import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/app/constants.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';


@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio
      , {String baseUrl}) = _AppServiceClient;

  @GET("/posts/1")
  Future<PostResponse> posts();
  @POST("/api/auth/login")
  Future<AuthenticationResponse> login(
      @Field("fcm_token") String fcmToken,
      @Field("email") String email,
      @Field("password") String password);
  @MultiPart()
  @POST("/api/auth/register")
  Future<RegisterAResponse> register(
      @Part(name: "city_id") int city_id,
      @Part(name: "area_id") int area_id,
      @Part(name: "street") String street,
      @Part(name: "subscription_id") int subscription_id,
      @Part(name: "firstName") String firstName,
      @Part(name:"lastName") String lastName,
      @Part(name:"email") String email,
      @Part(name:"password") String password,
      @Part(name:"phoneNumber") String phoneNumber,
      @Part(name:"transportation_line_id") int transportation_line_id,
      @Part(name: "transfer_position_id")  int transfer_position_id,
      @Part(name: "university_id")  int university_id,
      {
        @Part(name: "image")  File? image,

      }
      );

  @GET("/api/universities")
  Future<UniversitiesResponse> getUniversities();
  @POST("/api/dailyReservations/message")
  Future<BasePhoneResponse> getNumber(
      @Part(name: "phoneNumber")  int phoneNumber,
      );

  @GET("/api/transferPositions")
  Future<TransferPositionsResponse> getTransferPositions();

  @GET("/api/transportationLines")
  Future<TransportationLinesResponse> getTransportationLines();

  @GET("/api/subscriptions")
  Future<SubscriptionsResponse> getSubscriptions();

  @GET("/api/auth/profile")
  // @DioResponseType(ResponseType.stream)
  Future<ProfileResponse> profile();
  @GET("/api/transferPositions/transportationLines/{id}")
  Future<PositionLineResponse> positionLine(@Path("id") int lineId);

  @GET("/api/cities")
  Future<CitiesResponse> getCities();

  @GET("/api/areas/cities/{id}")
  Future<AreasResponse> getAreaByIdCity(@Path("id") int cityId);

  @GET("/api/locations/{id}")
  Future<LocationsResponse> getLocationsById(@Path("id") int locationId);

  @PUT("/api/students/{id}")
  @MultiPart()
  Future<UpdateStResponse> updateStudent(
      @Path("id") int studentId,
      {
        @Part(name: "city_id") int? city_id,
        @Part(name: "area_id") int? area_id,
        @Part(name: "street") String? street,
        @Part(name: "subscription_id") String? subscription_id,
        @Part(name: "firstName") String? firstName,
        @Part(name:"lastName") String? lastName,
        @Part(name:"oldPassword") String? oldPassword,
        @Part(name:"newPassword") String? newPassword,
        @Part(name:"newPassword_confirmation") String? newPassword_confirmation,
        @Part(name:"phoneNumber") String? phoneNumber,
        @Part(name:"transportation_line_id") String? transportation_line_id,
        @Part(name: "transfer_position_id")  String? transfer_position_id,
        @Part(name: "image", contentType: "image/jpeg") File? image,
        @Part(name: "university_id")  String? university_id
      }
      );

  @PUT("/api/students/{id}")
  @FormUrlEncoded()
  Future<UpdateStResponse> updateStudentt(
      @Path("id") int studentId,
      @Body() StudentRequest? studentRequest
      );

  @PUT("/api/students/{id}")
  @FormUrlEncoded()
  Future<UpdateStResponse> updatePassword(
      @Path("id") int studentId,
      @Body() PasswordRequest? passwordRequest
      );
  // @MultiPart()
  @POST("/api/students/{id}?_method=PUT")
  Future<UpdateStResponse> updateImage(
      @Path("id") int studentId,
      @Part() File  image
      );
  @POST("/api/auth/refresh/api/auth/refresh")
  Future<AuthenticationResponse> refresh();

  @GET("/api/user/notification")
  Future<NotificationResponse> notification();
  /*
  @GET('')
  @DioResponseType(ResponseType.bytes)
  Future<Uint16List> downloadImage(
     @Query('image') String url);
   */
  @POST("/api/auth/logout")
  Future<LogOutResponse> logout();
  @GET("/api/programs")
  Future<ProgramResponse> programs();
  @PUT("/api/student/programs/{id}")
  Future<ConfirmStudentResponse> confirmStudentAttendenceInTrip(
  @Path("id") int studentId,
  {
    @Field("confirmAttendance1") bool? confirmAttendance1,
    @Field("confirmAttendance2") bool? confirmAttendance2,
  }
  );

  @POST("/api/claims")
  Future<ClaimsResponse> claim(
      @Part(name: "trip_id")  int trip_id,
      @Part(name: "description")  String description,
      );
  @POST("/api/lost_found")
  Future<StoreLostFoundResponse> lostFound(
      @Part(name: "trip_id")  int trip_id,
      @Part(name: "description")  String description,
      {
        @Part(name: "image")  File? image,
      }
      );
  @GET("/api/lost_found")
  Future<LostAndFoundResponse> getAlllostFound();
  @POST("/api/auth/forgetPassword")
  Future<ForgetPasswordResponse> forgetPassword(
      @Part(name: "email")  String email,

      );
  @POST("/api/auth/ResetPassword")
  Future<ForgetPasswordResponse> ResetPassword(
      @Part(name: "email")  String email,
      @Part(name: "code")  int code,
      @Part(name: "newPassword")  String newPassword,

      );
  @POST("/api/supervisor/trip")
  Future<HomeSupervisorResponse> homeSupervisor(@Part(name: "time")  String time);
  @POST("/api/trip/todayTrips")
  Future<TodayTripsResponse> todayTrips(@Part(name: "time")  String time);

  @GET("/api/trip/weeklyTrips")
  Future<TripsResponse> weeklyTrips();

  @POST("/api/evaluation/trip/{id}")
  Future<EvaluationResponse> evaluation(
      @Path("id") int tripId,
      @Part(name:"review") int review
      );

  @PUT("/api/supervisors/{id}")
  @FormUrlEncoded()
  Future<UpdateSupervisorResponse> updateSuperVisor(
      @Path("id") int studentId,
      @Body() SupervisorRequest? supervisorRequest
      );

  @PUT("/api/supervisors/{id}")
  @FormUrlEncoded()
  Future<UpdateSupervisorResponse> updatePasswordSupervisor(
      @Path("id") int studentId,
      @Body() PasswordRequest? passwordRequest
      );
// @MultiPart()
  @POST("/api/supervisors/{id}?_method=PUT")
  Future<UpdateSupervisorResponse> updateImageSupervisor(
      @Path("id") int studentId,
      @Part() File  image
      );
  @GET("/api/dailyReservations/trips/{id}")
  Future<DailyReservationResponse> dailyReservations(
      @Path("id") int id
      );
  @GET("/api/supervisor/approve/{id}")
  Future<AcceptAndDenyResponse> approve(
      @Path("id") int id
      );
  @GET("/api/supervisor/deny/{id}")
  Future<AcceptAndDenyResponse> deny(
      @Path("id") int id
      );
  @POST("/api/supervisor/qrcode/confirm/trip/{trip_id}/user/{id}")
  Future<QrConfirmResponse> confirmStudentByQrCode(
      @Path("id") int id,
      @Path("trip_id") int tripId
  );
  @POST("/api/update/position")
  Future<UpdatePositionResponse> supervisorPositionUpdate(
      @Part(name:"trip_id") int tripId,
      @Part(name:"lng") double lng,
      @Part(name:"lat") double lat
      );
  @POST("/api/user/make_read_notification/{id}")
  Future<NotificationReadResponse> makeReadNotification(
      @Path("id") int id,
      );
  @GET("/api/user/make_all_read_notifications")
  Future<UpdatePositionResponse> readAllNot();
  @GET("/api/student/trips/{trip_id}/positions/{position_id}")
  Future<StudentPositionResponse> studentPosition(
      @Path("trip_id") int tripId,
      @Path("position_id") int positionId,


      );
  @POST("/api/dailyReservations/trips/{id}")
  Future<UserDailyReservationResponse> userDailyReservations(
      @Path("id") int id,
      @Part(name:"name") String name,
      @Part(name:"phoneNumber") int phoneNumber,
      @Part(name:"transfer_position_id") int transfer_position_id,
      @Part(name:"seatsNumber") int seatsNumber,
      @Part(name:"fcm_token") String fcm_token,
      );

  @POST("/api/algorithmInput")
  Future<AlgorithmResponse> algorithm(
      @Body() Map<String, dynamic> requestBody,
      );

}
