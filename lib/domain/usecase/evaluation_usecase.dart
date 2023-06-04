import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class EvaluationUseCase implements BaseUseCase<EvaluationUseCaseInput,String>{
  Repository _repository;
  EvaluationUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(EvaluationUseCaseInput input) async{
    return await _repository.evaluation(
        EvaluationRequest(input.tripId, input.review
        ));

  }


}
class EvaluationUseCaseInput{
  int tripId;
  int review;
  EvaluationUseCaseInput(this.tripId,this.review);
}