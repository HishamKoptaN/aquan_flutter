import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app/home_page/view/dashboard.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int cuttentIndex = 2;
  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                cuttentIndex = 2;
              },
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.home,
            color: Colors.white,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          height: 60,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: 30,
                  color:
                      cuttentIndex == 0 ? Colors.amber : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color:
                      cuttentIndex == 0 ? Colors.amber : Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    cuttentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color:
                      cuttentIndex == 0 ? Colors.amber : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      cuttentIndex = 4;
                    },
                  );
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color:
                      cuttentIndex == 0 ? Colors.amber : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        body: screens[cuttentIndex],
      ),
    );
  }
}