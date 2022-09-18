import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget {
  final Function callback;
  final String title;
  final IconData icon;
  const NavigationIcon({Key? key, required this.callback, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
