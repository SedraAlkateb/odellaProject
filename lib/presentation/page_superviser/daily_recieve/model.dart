class Student {
  String studentName;
  String studentEmail;
  String studentImage;
  String studentMobile;
  Trip studentTrip;

  Student(
      {required this.studentName,
        required this.studentEmail,
        required this.studentImage,
        required this.studentMobile,
        required this.studentTrip});
}

class Trip {
  String tripLine;
  String tripStartTime;
  String tripEndTime;
  String tripDate;
  List<String> tripSeats;
  String tripPosition;

  Trip(
      {required this.tripLine,
        required this.tripStartTime,
        required this.tripEndTime,
        required this.tripDate,
        required this.tripSeats,
        required this.tripPosition});
}
class Stu {
  String name;  String phone;  String position;  String seat;  Stu({required this.name,required this.phone, required this.position, required this.seat});}