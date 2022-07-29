import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:places_discover/classes/place.dart';
import 'package:places_discover/screens/place.dart';

class PlaceCard extends StatelessWidget {
  final Place place;
  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);
  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final _var = place.obs;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Get.to(PlaceScreen());
          },
          child: Hero(
            tag: _var.value.id!,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  _var.value.imageUrl!,
                  fit: BoxFit.fill,
                  height: height * 0.45,
                  width: width * 0.6,
                )),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: width * 0.2,
                height: height * 0.06,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFCD160),
                      size: width * 0.06,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      _var.value.rate.toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.04),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: InkWell(
            onTap: (() {
              if (_var.value.liked == true) {
                _var(Place(liked: false));
              } else if (_var.value.liked == false) {
                _var(Place(liked: true));
              }
            }),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: height * 0.06,
                  height: height * 0.06,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.4)),
                  child: Center(
                      child: Obx(
                    () => Icon(
                      _var.value.liked!
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: _var.value.liked! ? Colors.red : Colors.white,
                      size: width * 0.06,
                    ),
                  )),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: width * 0.2,
                height: height * 0.06,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: const Color(0xFFC94600),
                        size: width * 0.06,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '${_var.value.name!}, ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: width * 0.03,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: _var.value.state!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: width * 0.03,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
