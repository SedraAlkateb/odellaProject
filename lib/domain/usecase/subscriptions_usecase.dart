import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class SubscriptionsUseCase implements BaseUseCase<Null,Subscriptions>{
  Repository _repository;

  SubscriptionsUseCase(this._repository);

  @override
  Future<Either<Failure, Subscriptions>> execute(Null input) async{
    return await _repository.getSubscriptions();

  }


}