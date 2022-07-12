// ignore_for_file: avoid_print

import 'package:e_shop/constants.dart'; 
import 'package:e_shop/screens/register_page.dart';
import 'package:e_shop/widgets/custom_btn.dart';
import 'package:e_shop/widgets/custom_input.dart';
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
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  ),
                child: Text("Welcome User,\nLogin To Your Account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                      CustomInput(
                        hintText: "Email..."
                      ),
                      CustomInput(
                        hintText: "Password..."
                      ),
                      CustomBtn(
                        text: "Login",
                        onPressed: () {
                          print("Clicked the Login Button");
                        }, 
                        outlineBtn: false, 
                        isLoading: false,
                      ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                    ), 
                  child: CustomBtn(
                    text: "Create New Account",
                    onPressed: () {
                      Navigator.push(
                        context, 
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage()
                       ),
                      );
                    },
                    outlineBtn: false, 
                    isLoading: false,
                  ),
              ),
            ],
          ),
        ),
      )
    );
  }
} 
