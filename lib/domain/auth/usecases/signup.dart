import 'package:dartz/dartz.dart';
import 'package:movie_app/core/useCase/usecase.dart';
import 'package:movie_app/data/auth/models/signup_param.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class Signup extends UseCase<Either,SignupParam>{
 
  @override
  Future<Either> call({SignupParam ? params}) async {
      return await sl<AuthRepository>().signup(params!);
  }
}