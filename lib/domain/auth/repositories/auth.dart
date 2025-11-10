import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_param.dart';
import 'package:movie_app/data/auth/models/signup_param.dart';

abstract class AuthRepository{
  Future <Either> signup(SignupParam params);
  Future <Either> login(SignInParam params);
  Future <bool> isLoggedIn();
}