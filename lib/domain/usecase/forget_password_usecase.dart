
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class ForgetPasswordUseCase implements BaseUseCase<String,String>{
  Repository _repository;
  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) {
    return _repository.forgetPassword(input);
  }

}


