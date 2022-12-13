import 'package:flutter/material.dart';
import 'package:price_list_pro/common/widgets/custom_button.dart';
import 'package:price_list_pro/common/widgets/custom_textfield.dart';
import 'package:price_list_pro/constants/constants.dart';
import 'package:price_list_pro/features/auth/signin_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  static const String id = "/signUpScreen";
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
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
            const Flexible(
              child: Icon(
                Icons.person_outlined,
                color: Colors.blueAccent,
                size: 150,
              ),
            ),
            const SizedBox(height: 30,),
            CustomTextField(label: "Name", controller: nameController),
            const SizedBox(height: 20,),
            CustomTextField(label: "Email", controller: emailController),
            const SizedBox(height: 20,),
            CustomTextField(label: "Password", controller: passwordController),
            const SizedBox(height: 30,),
            CustomButton(text: "Sign in", onPressed: (){}),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("do you have account?"),
                GestureDetector(
                    onTap: (){
                      Navigator.popAndPushNamed(context, SignInScreen.id);
                    },
                    child: const Text("Sign in",style: TextStyle(color: kColor1),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}