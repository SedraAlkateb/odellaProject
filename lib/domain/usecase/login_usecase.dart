import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication>{
  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
    return await _repository.login(LoginRequest(input.email, input.password,input.fcmtoken));

  }


}
class LoginUseCaseInput{
  String email;
  String password;
  String fcmtoken;
  LoginUseCaseInput(this.email,this.password,this.fcmtoken);
}