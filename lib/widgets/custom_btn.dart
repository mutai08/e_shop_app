// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn=false;
  final bool isLoading;
  const CustomBtn ({Key? key, required this.text, required this.onPressed, required bool outlineBtn, required this.isLoading, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn;
    bool _isLoading = isLoading;


    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        height: 65.0,

        decoration: BoxDecoration(
          color: outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0,),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: Stack(
          children: [
            Visibility (
              visible: _isLoading ? false : true,
              child: Center(
                child: Text(
                  "Create New Account",
                style: TextStyle(
                  fontSize: 16.0,
                  color: _outlineBtn ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading,
              child:  const Center(
                child: SizedBox(
                  height:30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }    
}