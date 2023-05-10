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

  }
  );
}
