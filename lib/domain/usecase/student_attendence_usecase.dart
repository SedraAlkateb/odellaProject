
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class StudentAttendenceUsecase implements BaseUseCase<StudentAttendenceUseCaseInput,Null>{
  Repository _repository;
  StudentAttendenceUsecase(this._repository);

  @override
  Future<Either<Failure, Null>> execute(StudentAttendenceUseCaseInput input) {
    return _repository.confirmStudentAttendenceInTrip(
        ConfirmStudent(
          input.studentId,
            confirmAttendance1:   input.confirmAttendance1,
          confirmAttendance2: input.confirmAttendance2
        ));
  }

}


class StudentAttendenceUseCaseInput {
  int studentId;
  bool? confirmAttendance1;
  bool? confirmAttendance2;


  StudentAttendenceUseCaseInput(this.studentId, {
    this.confirmAttendance1,this.confirmAttendance2
  });
}