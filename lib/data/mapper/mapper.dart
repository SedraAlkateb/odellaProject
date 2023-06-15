import 'package:untitled/app/constants.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/app/extentions.dart';

extension PostResponseMapper on PostResponse? {
  PostModel toDomain() {
    return PostModel(
        this?.id.orZero() ?? Constants.zero,
        this?.userId.orZero() ?? Constants.zero,
        this?.title.orEmpty() ?? Constants.empty,
        this?.body.orEmpty() ?? Constants.empty);
  }
}

//////////// time
extension TimeResponseMapper on TimeResponse? {
  Time toDomain() {
    return Time(
        this?.id.orZero() ?? Constants.zero,
        this?.start.orEmpty() ?? Constants.empty,
      this?.date.orEmpty() ?? Constants.empty
    );
  }
}
extension LineResponseMapper on LineResponse? {
  Line toDomain() {
    return Line(
        this?.name.orEmpty() ?? Constants.empty,
    );
  }
}
extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    List<RoleModel> roleModel =
    (this?.roles?.map((roleResponse) => roleResponse.toDomain()) ??
        const Iterable.empty())
        .cast<RoleModel>()
        .toList();
    return UserModel(
        this?.id.orZero() ?? Constants.zero,
        this?.firstName.orEmpty() ?? Constants.empty,
        this?.lastName.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.phoneNumber.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        this?.location_id ?? Constants.empty,
        this?.subscription_id ?? Constants.empty,
        this?.transportation_line_id ?? Constants.empty,
        this?.transfer_position_id ?? Constants.empty,
        this?.university_id ?? Constants.empty,
        roleModel);
  }
}


extension RoleResponseMapper on RoleResponse? {
  RoleModel toDomain() {
    return RoleModel(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.guard_name.orEmpty() ?? Constants.empty);
  }
}
extension HomeSupervisorMapper on HomeSupervisorResponse? {
  HomeSuperVisor toDomain() {
    return HomeSuperVisor(
        this?.dataHomeSupervisor.toDomain()
    );
  }
}

extension DataHomeSuperVisorMapper on DataHomeSupervisorResponse? {
  DataHomeSupervisor toDomain() {
    List<DataTransferPositions> transferPosition =
    (this?.transferPositions?.map((roleResponse) => roleResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataTransferPositions>()
        .toList();
    List<Line> line =
    (this?.lines?.map((roleResponse) => roleResponse.toDomain()) ??
        const Iterable.empty())
        .cast<Line>()
        .toList();
    List<User> user =
    (this?.users?.map((roleResponse) => roleResponse.toDomain()) ??
        const Iterable.empty())
        .cast<User>()
        .toList();
    return DataHomeSupervisor(
        this?.id.orZero() ?? Constants.zero,
        this?.time.toDomain(),
        this?.availableSeats.orZero() ?? Constants.zero,
        transferPosition,
      line,
      user
    );
  }
}

extension UpdateUserResponseMapper on UpdateStudentResponse? {
  StudentModel toDomain() {
    return StudentModel(
        this?.location_id.orEmpty() ?? Constants.empty,
        this?.subscription_id.orEmpty() ?? Constants.empty,
        this?.transportation_line_id.orEmpty() ?? Constants.empty,
        this?.transfer_position_id.orEmpty() ?? Constants.empty,
        this?.university_id.orEmpty() ?? Constants.empty,
        this?.id.orZero() ?? Constants.zero,
        this?.firstName.orEmpty() ?? Constants.empty,
        this?.lastName.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.phoneNumber.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        this?.locationResponse.toDomain());
  }
}

extension LocationResponseMapper on LocationResponse? {
  LocationModel toDomain() {
    return LocationModel(
      this?.id.orZero() ?? Constants.zero,
      this?.city_id.orEmpty() ?? Constants.empty,
      this?.area_id.orEmpty() ?? Constants.empty,
      this?.street.orEmpty() ?? Constants.empty,
    );
  }
}

extension UpdateStudentResponseMapper on UpdateStResponse? {
  UpdateStudentModel toDomain() {
    return UpdateStudentModel(
      this?.updateStudentResponse.toDomain(),
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.dataUserResponse.toDomain(),
    );
  }
}
extension UniversityResponseMapper on UniversityResponse? {
  UniversityModel toDomain() {
    return UniversityModel(
      this?.id.orZero() ??Constants.zero,
      this?.name.orEmpty() ??Constants.empty,
    );
  }
}

extension ProfileResponseMapper on ProfileResponse? {
  UserProfile toDomain() {
    return UserProfile(
        this?.userResponse!.id.orZero() ??Constants.zero,
        this?.userResponse!.firstName.orEmpty() ??Constants.empty,
        this?.userResponse!.lastName.orEmpty() ??Constants.empty,
    this?.userResponse!.email.orEmpty() ??Constants.empty,
      this?.userResponse!.phoneNumber.orEmpty() ??Constants.empty,
      this?.userResponse!.image.orEmpty() ??Constants.empty,
      this?.userResponse!.expiredSubscriptionDate.orEmpty() ??Constants.empty,

      this?.userResponse!.line.toDomain(),
      this?.userResponse!.position.toDomain(),
      this?.userResponse!.location.toDomain(),
      this?.userResponse!.university.toDomain(),
      this?.userResponse!.subscription.toDomain(),

    );
  }
}

extension RegistResponseMapper on RegisterAResponse? {
  Profile toDomain() {
    return Profile(
      this?.registerResponse.toDomain(),
    );
  }
}

extension RegisterDataResponseMapper on RegisterResponse? {
  UserModel toDomain() {
    List<RoleModel> roleModel =
    (this?.roles?.map((roleResponse) => roleResponse.toDomain()) ??
        const Iterable.empty())
        .cast<RoleModel>()
        .toList();
    return UserModel(
        this?.id.orZero() ?? Constants.zero,
        this?.firstName.orEmpty() ?? Constants.empty,
        this?.lastName.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.phoneNumber.orEmpty() ?? Constants.empty,
        Constants.empty,
        this?.location_id.toString() ?? Constants.empty,
        this?.subscription_id.toString() ?? Constants.empty,
        this?.transportation_line_id.toString() ?? Constants.empty,
        this?.transfer_position_id ?? Constants.empty,
        this?.university_id ?? Constants.empty,
        roleModel);
  }
}

extension DataUserResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(this?.userResponse.toDomain(),
        this?.access_token.orEmpty() ?? Constants.empty);
  }
}

extension UniversitiesResponseMapper on UniversitiesResponse? {
  Universities toDomain() {
    List<DataModel> dataModel = (this
        ?.dataResponse
        ?.dataResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataModel>()
        .toList();
    return Universities(dataModel);
  }
}

extension DataResponseMapper on DataResponse? {
  DataModel toDomain() {
    return DataModel(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.shortcut.orEmpty() ?? Constants.empty);
  }
}

////////////////TransferPositions
extension DataTransferPositionsResponseMapper
on DataTransferPositionsResponse? {
  DataTransferPositions toDomain() {
    return DataTransferPositions(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.lng.orEmpty() ??Constants.empty,
      this?.lat.orEmpty() ??Constants.empty
    );
  }
}

extension TransferPositionsResponseMapper on TransferPositionsResponse? {
  TransferPositions toDomain() {
    List<DataTransferPositions> dataModel = (this
        ?.transferPositionsDataMainResponse?.transferPositionsDataResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataTransferPositions>()
        .toList();
    return TransferPositions(dataModel);
  }
}

////////////////////TRANSPORTATION LINSE
extension DataTransportationLinesResponseMapper
on DataTransportationLinesResponse? {
  DataTransportationLines toDomain() {
    return DataTransportationLines(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.from.toDomain(),
        this?.to.toDomain());
  }
}

extension TransportationLinesResponseMapper on TransportationLinesResponse? {
  TransportationLines toDomain() {
    List<DataTransportationLines> dataModel = (this
        ?.transportationLinesDataResponse
        ?.dataTransportationLinesResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataTransportationLines>()
        .toList();
    return TransportationLines(dataModel);
  }
}

extension PivotLineResponseMapper on PivotLineResponse? {
  PivotLine toDomain() {
    return PivotLine(this?.transportation_line_id.orEmpty() ?? Constants.empty,
        this?.transfer_position_id.orEmpty() ?? Constants.empty);
  }
}

extension DataFromResponseMapper on FromResponse? {
  From toDomain() {
    return From(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.lng.orEmpty() ?? Constants.empty,
      this?.lat.orEmpty() ?? Constants.empty,
    );
  }
}

extension DataToResponseMapper on ToResponse? {
  To toDomain() {
    return To(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.lng.orEmpty() ?? Constants.empty,
      this?.lat.orEmpty() ?? Constants.empty,

    );
  }
}

////////////PositionLine
extension PositionLineResponseMapper on PositionLineResponse? {
  PositionLine toDomain() {
    List<DataTransferPositions> dataModel = (this
        ?.positionLineResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataTransferPositions>()
        .toList();
    return PositionLine(dataModel);
  }
}

/////////////////////SUBSCRIPTION
extension DataSubscriptionResponseMapper on DataSubscriptionResponse? {
  DataSubscriptions toDomain() {
    return DataSubscriptions(
        this?.id.orZero() ?? Constants.zero,
        this?.daysNumber.orEmpty() ?? Constants.empty,
        this?.price.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty);
  }
}
extension SubscriptionsResponseMapper on SubscriptionsResponse? {
  Subscriptions toDomain() {
    List<DataSubscriptions> dataModel = (this
        ?.subscriptionResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataSubscriptions>()
        .toList();
    return Subscriptions(dataModel);
  }
}

///////////////////////City///////
extension CityResponseMapper on CityResponse? {
  City toDomain() {
    return City(
        this?.cityId??Constants.zero,
        this?.name?? Constants.empty
    );
  }
}

////////////////////Cities///////
extension CitiesResponseMapper on CitiesResponse? {
  Cities toDomain() {
    List<City> dataModel = (this
        ?.citiesDataResponse?.cityResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<City>()
        .toList();
    return Cities(dataModel);
  }
}

///////////////Area///////////////
extension AreaResponseMapper on AreaResponse? {
  Area toDomain() {
    return Area(
      this?.id ?? Constants.zero,
      this?.name?? Constants.empty,
    );
  }
}

////////////////Areas/////////
extension AreasResponseMapper on AreasResponse? {
  Areas toDomain() {
    List<Area> dataModel = (this
        ?.areaResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<Area>()
        .toList();
    return Areas(dataModel);
  }
}

////////////Location//////////////////

extension LocationDataResponseMapper on LocationDataResponse? {
  Location toDomain() {
    return Location(
      this?.cityResponse?.toDomain(),
      this?.areaResponse?.toDomain(),
      this?.street ?? Constants.empty,
    );
  }
}
extension DataLocationResponseMapper on LocationsResponse? {
  DataLocation toDomain() {
    return DataLocation(
      this?.locationDataResponse?.toDomain(),

    );
  }
}

///////////////////////////
extension DataProgramResponseMapper on DayProgramResponse? {
  DataProgram toDomain() {
    return DataProgram(
      this?.id ?? Constants.zero,
      this?.day?.name ?? Constants.empty,
      this?.transfer_position.toDomain(),
      this?.start  ?? Constants.empty,
      this?.end ?? Constants.empty,
      this?.confirmAttendance1 ?? true ,
      this?.confirmAttendance2  ?? true,

    );
  }
}
extension ProgramResponseMapper on ProgramResponse? {
  Program toDomain() {
    List<DataProgram> dataModel = (this
        ?.dayProgramResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataProgram>()
        .toList();
    return Program(dataModel);
  }
}
extension MetaResponseMapper on MetaResponse? {
  Meta toDomain() {
    return Meta(
      this?.current_page ?? Constants.zero,
        this?.from ?? Constants.zero,
        this?.last_page ?? Constants.zero,
         (this?.links?.map((dataResponse) => dataResponse.toDomain()) ??
    const Iterable.empty())
        .cast<LinkMeta>()
        .toList()
    ,
    this?.path ??Constants.empty,
        this?.per_page??Constants.zero,
        this?.to??Constants.zero,
        this?.total??Constants.zero,

    );

  }
}
extension LinkMetaResponseMapper on LinkResponse? {
  LinkMeta toDomain() {
    return LinkMeta(
      this?.url ?? Constants.empty,
      this?.label ?? Constants.empty,
      this?.active ?? false
    );
  }
}
extension LinkResponseMapper on LinksLAFResponse? {
  Links toDomain() {
    return Links(
        this?.first ?? Constants.empty,
        this?.last ?? Constants.empty,
      this?.prev ?? Constants.empty,
      this?.next ?? Constants.empty,

    );
  }
}
extension TripResponseMapper on TripResponse? {
  Trip toDomain() {
    return Trip(
      this?.id ?? Constants.zero,
      this?.status ?? Constants.empty,
      this?.availableSeats ?? Constants.zero,

    );
  }
}
extension UserLFResponseMapper on UserLAFResponse? {
  User toDomain() {
    return User(
      this?.id ?? Constants.zero,
      this?.firstName ?? Constants.empty,
      this?.lastName ?? Constants.empty,
      this?.email ?? Constants.empty,
      this?.phoneNumber ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.expiredSubscriptionDate ?? Constants.empty,
    );
  }
}
extension LostAndFoundDataMapper on LostAndFoundDataResponse? {
  LostAndFoundData toDomain() {
    return LostAndFoundData(
      this?.id ?? Constants.zero,
      this?.description ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.trip.toDomain(),
      this?.user.toDomain()
    );
  }
}


extension LostAndFoundesponseMapper on LostAndFoundsResponse? {
  LostAndFound toDomain() {
    return LostAndFound(
      (this?.lostAndFoundDataResponse?.map((dataResponse) => dataResponse.toDomain()) ??
          const Iterable.empty())
          .cast<LostAndFoundData>()
          .toList(),
      this?.links.toDomain(),
      this?.meta.toDomain(),


    );
  }
}

extension LostFoundesponseMapper on LostAndFoundResponse? {
  LostFound toDomain() {
    return LostFound(
      this?.data.toDomain(),
    );
  }
}
extension BusMapper on BusResponse? {
  Bus toDomain() {
    return Bus(
      this?.id ?? Constants.zero,
      this?.key ?? Constants.empty,
      this?.capacity ?? Constants.empty,
      this?.details ?? Constants.empty,
      this?.image ?? Constants.empty,
    );
  }
}
extension DriverMapper on DriverResponse? {
  Driver toDomain() {
    return Driver(
      this?.id ?? Constants.zero,
      this?.firstname ?? Constants.empty,
      this?.lastname ?? Constants.empty,
      this?.number ?? Constants.empty,
    );
  }
}
extension BusDriverMapper on BusDriverResponse? {
  BusDriver toDomain() {
    return BusDriver(
      this?.bus.toDomain(),
      this?.driver.toDomain(),
    );
  }
}

extension DataTripsMapper on DataTripsResponse? {
  DataTrips toDomain() {
    return DataTrips(
      this?.id ?? Constants.zero,
      this?.busDriver.toDomain(),
      this?.time.toDomain(),
      this?.availableSeats ?? Constants.zero,
    );
  }
}
extension TripsMapper on TripsResponse? {
  Trips toDomain() {
    List<DataTrips> dataModel = (this
        ?.dataTrips
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataTrips>()
        .toList();
    return Trips(dataModel);
  }
}
extension SuperVisorResponseMapper on DataUpdateSupervisorResponse? {
  SupervisorUpdate toDomain() {
    return SupervisorUpdate(
      this?.id ?? Constants.zero,
      this?.firstName ?? Constants.empty,
      this?.lastName ?? Constants.empty,
      this?.email ?? Constants.empty,
      this?.phoneNumber ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.expiredSubscriptionDate ?? Constants.empty,
      this?.locationResponse.toDomain()
    );
  }
}
extension SuperVisorMapper on UpdateSupervisorResponse? {
  SuperVisor toDomain() {
return SuperVisor(
    this?.updateSupervisorResponse?.toDomain()
);
  }
}
extension DataDailyReservationResponseMapper on DataDailyReservationResponse? {
  DailyReservationsModel toDomain() {
    return DailyReservationsModel(
        this?.id ?? Constants.zero,
        this?.name ?? Constants.empty,
        this?.phoneNumber ?? Constants.empty,
        this?.seatsNumber ?? Constants.empty,
   //     dataTransferPositions:this?.position.toDomain() ,
    );
  }
}
extension DailyReservationResponseMapper on DailyReservationResponse? {
  DailyReservations toDomain() {
    List<DailyReservationsModel> dataModel = (this
        ?.dailyReservation
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DailyReservationsModel>()
        .toList();
    return DailyReservations(dataModel);
  }
}
extension AcceptAndDenyResponseMapper on  AcceptAndDenyResponse? {
  AcceptDenyModel toDomain() {
  return  AcceptDenyModel(this?.dailyReservationResponse.toDomain()
  );
  }
}