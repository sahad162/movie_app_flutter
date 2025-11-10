import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_param.dart';
import 'package:movie_app/data/auth/models/signup_param.dart';
import 'package:movie_app/data/auth/sources/auth_api.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository{


  @override
  Future<Either> signup(SignupParam params) async {
    var data= await sl<Authapi>().signup(params);
    return data.fold(
      (error){
        return Left(error);
      }
      ,(data) async {
        final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      });
  }

  @override
  Future<Either> login(SignInParam params) async{
     var data= await sl<Authapi>().login(params);
    return data.fold(
      (error){
        return Left(error);
      }
      ,(data) async {
        final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      });
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var token=sharedPreferences.getString("token");
    if(token==null){
      return false;
    }
    else{
      return true;
    }
  }

}