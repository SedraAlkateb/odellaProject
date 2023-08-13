
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class TodayTripsUseCase implements BaseUseCase<String,TodayTrips>{
  Repository _repository;

  TodayTripsUseCase(this._repository);

  @override
  Future<Either<Failure, TodayTrips>> execute(String input) async{
    return await _repository.todayTrips(input);
  }


}