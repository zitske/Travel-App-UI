import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesChip extends StatelessWidget {
  final String name;
  final String icon;
  const CategoriesChip({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Transform(
      transform: Matrix4.identity()..scale(1.4),
      child: Chip(
        backgroundColor: Colors.grey.shade100,
        padding: const EdgeInsets.all(5.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            icon,
            style: TextStyle(fontSize: width * 0.02),
          ),
        ),
        label: Text(
          name,
          style: TextStyle(color: Colors.grey.shade500, fontSize: width * 0.02),
        ),
      ),
    );
  }
}
