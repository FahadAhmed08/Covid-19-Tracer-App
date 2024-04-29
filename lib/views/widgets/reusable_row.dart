import 'package:flutter/material.dart';

class ReausableRow extends StatelessWidget {
  String title, value;
  ReausableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 185, 182, 182)),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 185, 182, 182)),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 75, 74, 74),
          )
        ],
      ),
    );
  }
}
