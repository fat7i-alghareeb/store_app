import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '" SOON "',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.grey[350],
        ),
      ),
    );
  }
}
