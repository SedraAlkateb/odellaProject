import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';

abstract class Repository{
  Future<Either<Failure,PostModel>>posts();
  Future<  Either<Failure,Authentication>>login(LoginRequest loginRequest);
  Future<  Either<Failure,Universities>>getUniversities();
  Future< Either<Failure,TransferPositions>>getTransferPositions();
  Future< Either<Failure,TransportationLines>>getTransportationLines();
  Future< Either<Failure,Subscriptions>>getSubscriptions();
  Future< Either<Failure,UserProfile>>profile();
  Future< Either<Failure,PositionLine>>positionLine(int id);
  Future< Either<Failure,Areas>>getAreasByCityId(int id);
  Future< Either<Failure,DataLocation>>getLocationById(int id);
  Future< Either<Failure,Cities>>getCities();

  Future< Either<Failure,Profile>>register(SignUpRequest signUpRequest);
  Future< Either<Failure,UpdateStudentModel>>updateStudent(UpdateStudentRequest updateStudentRequest);
  Future< Either<Failure,UpdateStudentModel>>updateStudentt(UpdateStudentRequest updateStudentRequest);
  Future< Either<Failure,UpdateStudentModel>>updatePassword(UpdatePasswordRequest updatePasswordRequest);
  Future< Either<Failure,UpdateStudentModel>>updateImage(UpdateImage updateImage);

  Future< Either<Failure,SuperVisor>>updateSupervisor(UpdataSupervisorRequest updataSupervisorRequest);
  Future< Either<Failure,SuperVisor>>updateSupervisorPassword(UpdatePasswordRequest updatePasswordRequest);
  Future< Either<Failure,SuperVisor>>updateSupervisorImage(UpdateImage updateImage);


  Future< Either<Failure,LogOutResponse>>logout();
  Future< Either<Failure,Program>>programs();
  Future< Either<Failure,Null>>confirmStudentAttendenceInTrip(ConfirmStudent confirmStudent);
  Future< Either<Failure,String>>storeLostFound(DescriptionRequest descriptionRequest);
  Future< Either<Failure,Null>>storeClaim(ClaimRequest claimRequest);
  Future< Either<Failure,LostFound>>getAllLostFound();
  Future< Either<Failure,String>>forgetPassword(String email);
  Future< Either<Failure,String>>resetPassword(RestPasswordRequest restPasswordRequest);
  Future< Either<Failure,HomeSuperVisor>>homeSupervisor(String time);
  Future< Either<Failure,String>>evaluation(EvaluationRequest evaluationRequest);
  Future< Either<Failure,WeeklyTripInfor>>weeklyTrip();
  Future< Either<Failure,DailyReservations>>dailyReservations(int id);
  Future< Either<Failure,String>>confirmStudentByQrCode(ConfirmQrRequest confirmQrRequest);
  Future< Either<Failure,AcceptDenyModel>>approve(int id);
  Future< Either<Failure,AcceptDenyModel>>deny(int id);
  Future<  Either<Failure,Authentication>>refresh();
  Future<  Either<Failure,Notification>>notification();
  Future<  Either<Failure,String>>supervisorPositionUpdate(PositionMap PositionMap);
  Future<  Either<Failure,String>>makeReadNotification(int id);
  Future<  Either<Failure,String>>readAllNot();
  Future<  Either<Failure,StudentPosition>>studentPosition(int trip,int position);
  Future<  Either<Failure,Reservation>>userDailyReservations(DailyReservationRequest dailyReservationRequest);
  Future< Either<Failure,TodayTrips>>todayTrips(String time);

}