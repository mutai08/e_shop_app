import 'package:e_shop/constants.dart';
import 'package:e_shop/widgets/bottom_tabs.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container (
            child: const Center(
              child: Text(
                "Homepage"
              )
            ),
          ),
          BottomTabs(),
        ],
      ),
    );
  }
}