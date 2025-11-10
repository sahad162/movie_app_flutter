
import 'package:movie_app/core/useCase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class Isloggedin extends UseCase<bool,dynamic>{
 
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}