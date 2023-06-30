import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';

import 'base_usecase.dart';

class WeeklyTripUsecase implements BaseUseCase<Null,WeeklyTripInfor>{
  Repository _repository;
  WeeklyTripUsecase(this._repository);
  @override
  Future<Either<Failure, WeeklyTripInfor>> execute(Null) async{
    return await _repository.weeklyTrip();
  }

}



