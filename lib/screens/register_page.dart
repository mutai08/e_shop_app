// ignore_for_file: unused_element

import 'package:e_shop/constants.dart';
import 'package:e_shop/widgets/custom_btn.dart';
import 'package:e_shop/widgets/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

//builder and alert dialog to display some errors

Future<void> _alertDialogueBuilder (String error) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
      return AlertDialog(
        title: const Text ("Error"),
        content: const Text(Error),
        actions: [    
           TextButton(
            child: const Text("Close dialog"),
            onPressed: () {
              Navigator.pop(context);
            },
            ),
        ],
      );
     });
  }
  //Create a new user account
  Future <String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _registerEmail, password: _registerPassword);
        return null;
      }on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
          }
        return e.message;
      } catch (e) {
       return e.toString();
     }
  }

  void _submitForm () async {
    //Set the form to loading state 
    setState(() {
      _registerFormLoading = true;  
    });

    //Run the create account method 
    String createAccountFeedback = await _createAccount();

    //If the string is not null, we got error while create account.
    if (createAccountFeedback != null) {
      _alertDialogueBuilder(createAccountFeedback);

    //Set the form to regular state [not loading]
        setState(() {
      _registerFormLoading = false;  
    });
    }
  }

  //Default form loading state 
  bool _registerFormLoading = false;

  //Form input fields values
  String _registerEmail = "";
  String _registerPassword = "";

  //Focus Node Input Fields
  FocusNode _passwordFocusNode;


  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }


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
                  top: 16.0,
                  ),
                child: Text("Create New Account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
                ),
              ),
              Column(               
                children: [
                      CustomInput(
                        hintText: "Email..."
                        onChanged: (value) {
                         _registerEmail= value; 
                        },
                        onSubmitted: (value){
                          _passwordFocusNode.requestFocus();
                        },
                        textInputAction: TextInputAction.next,
                      ),
                        CustomInput(
                        hintText: "Password..."
                        onChanged: (value){
                          _registerPassword= value;
                        },
                        focusNode: _passwordFocusNode,
                        isPasswordField: true,
                        onSubmitted: (value){
                          _submitForm();
                        },
                      ),
                      CustomBtn(
                        text: "Create New Account",
                        onPressed: () {
                          _submitForm();
                        }, 
                        outlineBtn: false,
                        isLoading: _registerFormLoading,
                      ),
                ],
              ),
              Padding(                
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: CustomBtn(
                  text: "Back to Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  outlineBtn: true, 
                  isLoading: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}