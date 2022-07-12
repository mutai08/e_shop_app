import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ]
      ),
               
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:const [
              BottomTabBtn(
                imagePath: "assets/images/tab_home.png",
              ),
              BottomTabBtn(
                imagePath: "assets/images/tab_search.png",
              ),
              BottomTabBtn(
                imagePath: "assets/images/saved.png",
              ),
              BottomTabBtn(
                imagePath: "assets/images/tab_logout.png",
              ),
          ],
        ),
     );
  }
}

class BottomTabBtn extends StatelessWidget {
  const BottomTabBtn({Key? key}) : super(key: key);
  final String imagePath;
  final bool selected;
  const BottomTabBtn({required this.imagePath, required this.selected});


  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 28.0,
        horizontal: 16.0,
      ),
      child: Image(
        image: AssetImage(
          imagePath ?? "assets/images/tab_home.png"
        ),
        width: 22.0,
        height: 22.0,
      ),
    );
  }
}