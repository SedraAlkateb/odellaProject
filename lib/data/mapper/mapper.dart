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

extension RoleResponseMapper on RoleResponse? {
  RoleModel toDomain() {
    return RoleModel(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.guard_name.orEmpty() ?? Constants.empty);
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
      this?.status.orZero() ?? Constants.zero,
    );
  }
}

extension ProfileResponseMapper on ProfileResponse? {
  Profile toDomain() {
    return Profile(
      this?.userResponse.toDomain(),
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
    );
  }
}

extension DataToResponseMapper on ToResponse? {
  To toDomain() {
    return To(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
    );
  }
}

////////////PositionLine
extension PositionLineResponseMapper on PositionLineResponse? {
  PositionLine toDomain() {
    List<From> dataModel = (this
        ?.positionLineResponse
        ?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<From>()
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

extension LocationDataResponseMapper on LocationsResponse? {
  Location toDomain() {
    return Location(
      this?.locationDataResponse?.cityResponse?.name ?? Constants.empty,
      this?.locationDataResponse?.areaResponse?.name ?? Constants.empty,
      this?.locationDataResponse?.street ?? Constants.empty,
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
      this?.confirmAttendance1 ?? Constants.empty,
      this?.confirmAttendance2 ?? Constants.empty,

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
