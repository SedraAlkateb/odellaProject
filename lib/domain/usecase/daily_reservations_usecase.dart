
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class DailyReservationUseCase implements BaseUseCase<int,DailyReservations>{
  Repository _repository;
  DailyReservationUseCase(this._repository);

  @override
  Future<Either<Failure, DailyReservations>> execute(int input) {
    return _repository.dailyReservations(input);
  }

}


