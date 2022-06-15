
import 'package:e_shop/screens/constants.dart';
import 'package:e_shop/screens/home_page.dart';
import 'package:e_shop/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

   LandingPage({Key? key}) : super(key: key); 


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        //if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text ("Error:${snapshot.error}"),
            ),
          );
        }

        //connection made to firebase - firebase app is runnin
        if(snapshot.connectionState==ConnectionState.done){
          //streamBuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,streamSnapshot){
              //if stream snapshot has error
              if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text ("Error:${streamSnapshot.error}"),
            ),
          );
        }
//Connection state active - Do the user login check inside the 
//if statement 

        if (streamSnapshot.connectionState == ConnectionState.active){

//Get the user
          Object? user = streamSnapshot.data;
//if user is null, we're not logged in
          if(user == null) {
//user not logged in, head to log in           
            return const LoginPage();
          } else {
// the user is logged in, head to homepage
            return const HomePage();
          }
        }

//Checking the auth state Loading...
        return const Scaffold(
          body: Center(
            child: Text ("Checking authentication...", 
            style: Constants.regularHeading,),
           ), 
        );


            },
          );
        }


//connecting to firebase loading...
        return const Scaffold(
          body: Center(
            child: Text ("Initialization App...", 
            style: Constants.regularHeading,),
           ), 
        );

      },
    );
  }
}
