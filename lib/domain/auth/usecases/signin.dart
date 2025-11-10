import 'package:dartz/dartz.dart';
import 'package:movie_app/core/useCase/usecase.dart';
import 'package:movie_app/data/auth/models/signin_param.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class SignIn extends UseCase<Either,SignInParam>{
 
  @override
  Future<Either> call({SignInParam ? params}) async {
    return await sl<AuthRepository>().login(params!);
  }
}