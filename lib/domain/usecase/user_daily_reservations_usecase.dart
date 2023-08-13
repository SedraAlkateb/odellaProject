import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UserDailyReservationsUseCase implements BaseUseCase<DailyReservationUseCaseInput,Reservation>{
  Repository _repository;
  UserDailyReservationsUseCase(this._repository);

  @override
  Future<Either<Failure, Reservation>> execute(DailyReservationUseCaseInput input) {
    return _repository.userDailyReservations(DailyReservationRequest(input.trip, input.name
        , input.phoneNumber,
        input.transfer_position_id,
        input.seatsNumber, input.fcm_token)
    );
  }
}


class DailyReservationUseCaseInput {
  int trip;
  String name;
  int phoneNumber;
  int transfer_position_id;
  int seatsNumber;
  String fcm_token;

  DailyReservationUseCaseInput(
      this.trip, this.name, this.phoneNumber,
      this.transfer_position_id, this.seatsNumber, this.fcm_token);
}