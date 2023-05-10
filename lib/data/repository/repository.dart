
import 'package:dartz/dartz.dart';
import 'package:untitled/data/data_source/remote_data_source.dart';
import 'package:untitled/data/network/error_handler.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/data/mapper/mapper.dart';
class RepositoryImp implements Repository {
  final RemoteDataSource _remoteDataSource;

// final NetworkInfo _networkInfo;

  RepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, PostModel>> posts() async {
    //  if(await _networkInfo.isConnected){
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.posts();
      if (response.status != ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
    /*
    }else{
      //return either left
      //return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    */
  }

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Universities>> getUniversities() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getUniversities();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Subscriptions>> getSubscriptions() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getSubscriptions();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }


  @override
  Future<Either<Failure, TransferPositions>> getTransferPositions() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getTransferPositions();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }


  @override
  Future<Either<Failure, TransportationLines>> getTransportationLines() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getTransportationLines();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Profile>> profile() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.profile();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, PositionLine>> positionLine(int id) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.positionLine(id);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Profile>> register(SignUpRequest signUpRequest) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.register(signUpRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, UpdateStudentModel>> updateStudent(
      UpdateStudentRequest updateStudentRequest) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updateStudent(
          updateStudentRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, UpdateStudentModel>> updateStudentt(
      UpdateStudentRequest updateStudentRequest) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updateStudentt(
          updateStudentRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Areas>> getAreasByCityId(int id) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getAreasByCityId(
          id);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }


  @override
  Future<Either<Failure, Cities>> getCities() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getCities();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Location>> getLocationById(int id) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.getLocationById(
          id);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, LogOutResponse>> logout() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.logout();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, UpdateStudentModel>> updatePassword(
      UpdatePasswordRequest updatePasswordRequest) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updatePassword(
          updatePasswordRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, UpdateStudentModel>> updateImage(
      UpdateImage updateImage) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updateImage(
          updateImage);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Program>> programs() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.programs();
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Null>> confirmStudentAttendenceInTrip(
      ConfirmStudent confirmStudent) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.confirmStudentAttendenceInTrip(
          confirmStudent);
      if (response.status == ApiInternalStatus.SUCCESS) {
        //success
        //return either right
        //return data
        return Right(null);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
}