import 'package:e_shop/screens/constants.dart';
import 'package:e_shop/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  ),
                child: Text("Welcome User,\nLogin To Your Account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
                ),
              ),
              Text("Input Fields"),
              CustomBtn(),
            ],
          ),
        ),
      ),
    );
  }
} 