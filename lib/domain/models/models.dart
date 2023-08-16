import 'dart:io';

import 'package:flutter/rendering.dart';

class DataAlgorithm{
  int id;
  String goTime;
  String returnTime;
  DataAlgorithm(this.id, this.goTime, this.returnTime);
}

class Algorithm{
  List<DataAlgorithm>? alg;
  Algorithm(this.alg);
}
class DataReservation{
  String fcm_token;
  int trip_id;
  int id;
  DataReservation(this.id,this.trip_id,this.fcm_token);
}
class Reservation{
  DataReservation? reservation;
  Reservation(this.reservation);
}
class Time{
  int id;
  String start;
  String date;

  Time(this.id, this.start, this.date);
}
class StudentPosition{
  List<UserConf> users;

  StudentPosition(this.users);
}
class EvaluationTrip{
  int id;
  String review;
  int idTrip;

  EvaluationTrip(this.id, this.review, this.idTrip);
}
class WeeklyTrip{
  List<EvaluationTrip>? evaluation;
List<DataTrips> trips;
  WeeklyTrip(this.evaluation,this.trips);
}
class WeeklyTripInfor{
  WeeklyTrip? weeklyTrip;
  WeeklyTripInfor(this.weeklyTrip);
}
class Line{
  String name;
  Line(this.name);
}
class HomeSuperVisor{
  DataHomeSupervisor? dataHomeSupervisor;

  HomeSuperVisor(this.dataHomeSupervisor);
}

class DataHomeSupervisor{
  int id;
  Time? time;
  int availableSeats;
  List<DataTransferPositions>? dataTransferPositions;
  List<Line>? lines;
  List<UserConf>? users;

  DataHomeSupervisor(this.id, this.time, this.availableSeats,
      this.dataTransferPositions, this.lines, this.users);
}
class TodayTrips{
  List<DataTodayTrips>? dayTrips;
  TodayTrips(this.dayTrips);
}
class DataTodayTrips{
  int id;
  Time? time;
  int availableSeats;
  List<DataTransferPositions>? dataTransferPositions;
  List<DataTransportationLines>? lines;

  DataTodayTrips(this.id, this.time, this.availableSeats,
      this.dataTransferPositions, this.lines);
}
class Counter{
  int count=0;
  Counter({this.count=0});
}
class PostModel{
  int userId;
  int id ;
  String title;
  String body;
  PostModel(this.id, this.userId, this.title, this.body);
}


class UserModel{
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? image;
  String location_id;
  String subscription_id;
  String transportation_line_id;
  String transfer_position_id;
  String university_id;
  List<RoleModel> roleModel ;

  UserModel(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.location_id,
      this.subscription_id,
      this.transportation_line_id,
      this.transfer_position_id,
      this.university_id,
      this.roleModel);
}

class StudentModel{
  String location_id;
  String subscription_id;
  String transportation_line_id;
  String transfer_position_id;
  String university_id;
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? image;
  LocationModel? locationModel ;

  StudentModel(
      this.location_id,
      this.subscription_id,
      this.transportation_line_id,
      this.transfer_position_id,
      this.university_id,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.image,
      this.locationModel);
}
class UpdateStudentModel{
  StudentModel? studentModel;

  UpdateStudentModel(this.studentModel);
}


class UserData{
  UserModel? userModel;
  String access_token;

  UserData(this.userModel, this.access_token);
}
class Authentication{
  UserData? userData;
  Authentication(this.userData);
}
class Profile{
  UserModel? userModel;
  Profile(this.userModel);
}
class UniversityModel{
  int id;
  String name;

  UniversityModel( this.id,this.name);
}
class UserProfile{
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? image;
  String expiredSubscriptionDate;
  DataTransportationLines? line;
  DataTransferPositions? position;
  Location? location;
  UniversityModel? university;
  DataSubscriptions? subscription;
  UserProfile(
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
}

class DataModel{
  int id;
  String name ;
  String shortcut;

  DataModel(this.id, this.name, this.shortcut);
}
class RoleModel{
  int id;
  String name ;
  String guard_name;

  RoleModel(this.id, this.name, this.guard_name);
}
class Universities{
  List<DataModel> dataModel;

  Universities(this.dataModel);
}

class TransferPositions {
  List<DataTransferPositions> dataTransfer;

  TransferPositions(this.dataTransfer);
}
class DataTransferPositions{
  int id;
  String name;
String lat;
String lng;
  DataTransferPositions(this.id, this.name,this.lng,this.lat);
}

class PositionLine{
  List<DataTransferPositions> positionLine;
  PositionLine(this.positionLine);
}

////////////////////////////SUBSCRIPTIONS
class Subscriptions{
  List<DataSubscriptions> dataSubscriptions;
  Subscriptions(this.dataSubscriptions);
}
class DataSubscriptions{
  int id;
  String daysNumber;
  String price;
  String name;
  DataSubscriptions(this.id, this.daysNumber, this.price, this.name);
}


/////////////////TRANSPORTATIONLINES
class PivotLine{

  String transportationLineId;
  String transferPositionId;

  PivotLine(this.transportationLineId, this.transferPositionId);
}
class From{
  int id;
  String name;
String lng;
String lat;
  From(this.id, this.name,this.lng,this.lat);
}
class To{
  int id;
  String name;
  String lng;
  String lat;
  To(this.id, this.name, this.lng, this.lat);
}
class DataTransportationLines {
  int id;
  String name;
  From? from;
  To? to;

  DataTransportationLines(this.id, this.name, this.from, this.to);
}
class TransportationLines{
  List<DataTransportationLines> dataTransportationLines;

  TransportationLines(this.dataTransportationLines);
}

class City{
  int id;
  String name;

  City(this.id, this.name);
}

class Area{
  int id;
  String name;

  Area(this.id ,this.name);
}

class Location{
  City? city;
  Area? area;
  String street;
  Location(this.city, this.area, this.street);
}
class Cities{
  List<City>? cities;
  Cities(this.cities);
}
class Areas{
  List<Area>? areas;
  Areas(this.areas);
}
class LocationModel{
  int id;
  String city_id;
  String area_id;
  String street;
  LocationModel(this.id, this.city_id, this.area_id, this.street);
}

////////////////////programs//////////////

class Program {
  List<DataProgram> dataProgram;

  Program(this.dataProgram);
}
class Day{
  int id;
  String day;
  Day(this.id,this.day);
}
class DataProgram{
  int id;
  Day? day;
  DataTransferPositions? dataTransferPositions;
  String start ;
  String end ;
  bool confirmAttendance1 ;
  bool confirmAttendance2 ;
  List<String> line;

  DataProgram(this.id, this.day, this.dataTransferPositions, this.start, this.end,
      this.confirmAttendance1, this.confirmAttendance2,this.line);
}
class Claims{
int id;
Trip? trip;
User? user;
String description;

Claims(this.id, this.trip, this.user, this.description);
}
class Trip{
int id;
String status;
int availableSeats;

Trip(this.id, this.status, this.availableSeats);
}
class User{
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String image;
  String expiredSubscriptionDate;

  User(this.id, this.firstName, this.lastName, this.email, this.phoneNumber,
      this.image, this.expiredSubscriptionDate);
}
class UserConf{
 User user;
List<TripUsers> triUser;
  UserConf(this.user,this.triUser);
}
class TripUsers{
  int id;
  String user_id;
  String TripId;
  String StudentAttendance;
  TripUsers(this.id, this.user_id, this.TripId, this.StudentAttendance);
}

class LostAndFoundData{
  int id;
  String description;
  String image;
  Trip? trip;
  User? user;

  LostAndFoundData(this.id, this.description, this.image, this.trip, this.user);
}
class Links{
String  first;
String  last;
String  prev;
String  next;

Links(this.first, this.last, this.prev, this.next);
}
class LinkMeta{
  String url;
  String label;
  bool active;

  LinkMeta(this.url, this.label, this.active);
}
class Meta{
  int current_page;
  int from;
  int last_page;
  List<LinkMeta>? links;
  String path;
  int  per_page;
  int  to;
  int  total;

  Meta(this.current_page, this.from, this.last_page, this.links, this.path,
      this.per_page, this.to, this.total);
}
class LostAndFound{
  List<LostAndFoundData>? lostAndFoundData;
  Links? links;
  Meta? meta;

  LostAndFound(this.lostAndFoundData, this.links, this.meta);
}
class LostFound{
  LostAndFound? lostAndFound;
  LostFound(this.lostAndFound);
}
class Bus{
  int id;
  String key;
  String capacity;
  String details;
  String image;

  Bus(this.id, this.key, this.capacity, this.details, this.image);
}
class NotificationModel{
  int id;
  String title;
  String type;
  String body;
  String isRead;

  NotificationModel(this.id, this.title, this.type, this.body, this.isRead);
}
class Notification{
  List<NotificationModel>? notification;
  Notification(this.notification);
}
class Driver {
  int id;
  String firstname;
  String lastname;
  String number;

  Driver(this.id, this.firstname, this.lastname, this.number);
}
class BusDriver {
  Bus? bus;
  Driver? driver;
  BusDriver(this.bus, this.driver);
}
class DataTrips {
  int id;
  BusDriver? busDriver;
  Time? time;
  int availableSeats;

  DataTrips(this.id, this.busDriver, this.time, this.availableSeats);
}
class Trips {

  List<DataTrips>? dataTrips;

  Trips(this.dataTrips);
}

class SupervisorUpdate{
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String image;
  String expiredSubscriptionDate;
  Location? location;
  SupervisorUpdate(this.id, this.firstName, this.lastName, this.email, this.phoneNumber,
      this.image, this.expiredSubscriptionDate,this.location);
}
class DataLocation{
  Location? location;

  DataLocation(this.location);
}
class SuperVisor{
  SupervisorUpdate? supervisorUpdate;

  SuperVisor(this.supervisorUpdate);
}
class AcceptDenyModel{
  DailyReservationsModel? dailyReservationsModel;

  AcceptDenyModel(this.dailyReservationsModel);
}
class DailyReservationsModel{
  int id;
  String name;
  String phoneNumber;
  String seatsNumber;
 // DataTransferPositions? dataTransferPositions;

  DailyReservationsModel(
      this.id, this.name, this.phoneNumber, this.seatsNumber,
     // { this.dataTransferPositions}
      );
}
class DailyReservations{
  List<DailyReservationsModel>? dailyReservationsModel;
  DailyReservations(this.dailyReservationsModel);
}
//DataDailyReservationResponse
//DailyReservationResponse