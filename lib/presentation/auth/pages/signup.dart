import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/messages/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';
import 'package:movie_app/data/auth/models/signup_param.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 150, right: 18, left: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 18),
            _passwordField(),
            SizedBox(height: 50),
            _signupButton(context),
            SizedBox(height: 18),
            _signInText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailcont,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passcont,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign up',
      activeColor: AppColors.primaryColor,
      onPressed: () async {
        final result=await sl<Signup>().call(
          params: SignupParam(email: _emailcont.text,
           password: _passcont.text),
        );
        return result;
      },
      onSuccess: () {
          AppNavigator.pushAndRemove(context, const HomePage());

      },
      onFailure: (error) {
        DisplayMessage.ErrorMessage(error, context);
      },
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "you alraedy have an account?"),
          TextSpan(
            text: "Sign in",
            style: TextStyle(color: Colors.blue[300]),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignInPage());
              },
          ),
        ],
      ),
    );
  }
}
