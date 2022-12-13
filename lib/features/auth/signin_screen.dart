import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/auth/signup_screen.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  static const String id = "/signInScreen";
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outlined,
              color: Colors.blueAccent,
              size: 150,
            ),
            const SizedBox(height: 30,),
            CustomTextField(label: "Email", controller: emailController),
            const SizedBox(height: 20,),
            CustomTextField(label: "Password", controller: emailController),
            const SizedBox(height: 30,),
            CustomButton(text: "Sign in", onPressed: (){}),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.popAndPushNamed(context, SignUpScreen.id);
                  },
                    child: const Text("Sign up",style: TextStyle(color: kColor1),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
