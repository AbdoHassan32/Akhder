import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ItemCount extends StatefulWidget {
  @override
  _ItemCountState createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrement,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: Colors.grey)),
          //color: Colors.blue,
          height: 25,
          width: 20,
          child: Center(
            child: Text(
              count.toString(),
              style: Styles.textStyle14,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
          onPressed: increment,
        ),
      ],
    );
  }
}