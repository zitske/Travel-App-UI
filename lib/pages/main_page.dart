import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places_discover/classes/card.dart';
import 'package:places_discover/classes/chip.dart';
import 'package:places_discover/classes/controller.dart';
import 'package:places_discover/classes/place.dart';
import 'package:places_discover/screens/place.dart';

class MainPage extends StatelessWidget {
  final grandCanyon = Place(
      name: "Grand Canyon",
      imageUrl:
          "https://i0.wp.com/ideawallpapers.com/wp-content/uploads/2020/02/iphone-wallpaper-38.jpg?w=571&ssl=1",
      id: 12312412,
      rate: 4.2,
      state: "Arizona",
      liked: false);
  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: "Location",
        icon: Icon(Icons.local_activity),
      )
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: items,
        ),
        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: Container(
          height: height * 0.06,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search',
                    ),
                  )),
                  Container(
                    color: Colors.grey.shade300,
                    height: height * 0.03,
                    width: 2,
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.settings)
                ]),
          ),
        )));
  }
}
