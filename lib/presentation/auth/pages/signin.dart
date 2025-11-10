import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/messages/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';
import 'package:movie_app/data/auth/models/signin_param.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/presentation/auth/pages/signup.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 150,right: 18,left: 18),
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _signinText(),
          SizedBox(height: 30,),
          _emailField(),
          SizedBox(height: 18,),
          _passwordField(),
            SizedBox(height: 50,),
          _signinButton(context),
           SizedBox(height: 18,),
          _signupText(context)
        ],
      )
      ),
    );
  }

  Widget _signinText(){
    return Text('Sign In',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24
    ),);
  }

  Widget _emailField(){
    return TextField(
      controller: _emailcont,
    decoration: InputDecoration(
      hintText: "Email"
    ),
    );
  }

  Widget _passwordField(){
    return TextField(
      controller: _passcont,
      decoration: InputDecoration(
        hintText: "Password"
      ),
    );
  }

  Widget _signinButton(BuildContext context){
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primaryColor,
    onPressed: () async {
      final result=await sl<SignIn>().call(
        params: SignInParam(email: _emailcont.text,
        password: _passcont.text),
      );
      return result;
    }, 
    onSuccess: (){
      AppNavigator.pushAndRemove(context, const HomePage());
      
    },
     onFailure: (error){
      DisplayMessage.ErrorMessage(error, context);
     }
     );
  }

  Widget _signupText(BuildContext context){
    return Text.rich(
      TextSpan(
        children:[
          TextSpan(
            text: "Don't you have an account?"
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.blue[300]
            ),
            recognizer: TapGestureRecognizer()..onTap=(){
              AppNavigator.push(context, SignUpPage());
            }
          )
        ]
      )
    );
    
  }
  
}