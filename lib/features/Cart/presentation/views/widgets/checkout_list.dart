
import 'package:flutter/material.dart';

class Checkoutlist extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  const Checkoutlist({super.key, required this.title, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap:onPressed ,
          child: Padding(
            padding: const EdgeInsets.all( 15),
            child:  Row(
              children: [
                Text(title,
                  style: const TextStyle(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                 Expanded(
                  child: Text(value,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                 const Icon(Icons.arrow_forward_ios),
          
          
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black12,
          height: 1,
        ),

      ],
    );
  }
}
