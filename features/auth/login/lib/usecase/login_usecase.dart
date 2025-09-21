import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/login_repository.dart';
import 'package:login/domain/model/login_model.dart';

class LoginUsecase implements BaseUsecase<LoginRequest, LoginModel> {
  final LoginRepository loginRepository;
  LoginUsecase(this.loginRepository);
  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest input) {
    return loginRepository.login(input);
  }
}
