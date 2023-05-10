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
  int status;
  UserData? userData;
  Authentication(this.userData,this.status);
}
class Profile{
  UserModel? userModel;
  Profile(this.userModel);
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

  DataTransferPositions(this.id, this.name);
}

class PositionLine{
  List<From> positionLine;
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

  From(this.id, this.name);
}
class To{
  int id;
  String name;

  To(this.id, this.name);
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
class City1{

  String name;

  City1( this.name);
}
class Area{
  String name;

  Area( this.name);
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
class Location{
  String city;
  String area;
  String street;
  Location(this.city, this.area, this.street);
}
////////////////////programs//////////////

class Program {
  List<DataProgram> dataProgram;

  Program(this.dataProgram);
}
class DataProgram{
  int id;
  String day;
  DataTransferPositions? dataTransferPositions;
  String start ;
  String end ;
  String confirmAttendance1 ;
  String confirmAttendance2 ;

  DataProgram(this.id, this.day, this.dataTransferPositions, this.start, this.end,
      this.confirmAttendance1, this.confirmAttendance2);
}
