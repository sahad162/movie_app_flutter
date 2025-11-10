import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_param.dart';
import 'package:movie_app/data/auth/models/signup_param.dart';
import 'package:movie_app/service_locator.dart';

abstract class Authapi {
  Future<Either> signup(SignupParam params);
  Future<Either> login(SignInParam params);
}

class AuthApiService extends Authapi {
  @override
  Future<Either> signup(SignupParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> login(SignInParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.login,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e){
      return Left(e.response!.data['message']);
    }
  }
}
