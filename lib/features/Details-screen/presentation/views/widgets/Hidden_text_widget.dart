import 'package:flutter/material.dart';

import '../../../../home/data/models/product.dart';

class HiddenTextWidget extends StatefulWidget {
  const HiddenTextWidget({super.key, required this.product});
  final Product product;
  @override
  _HiddenTextWidgetState createState() => _HiddenTextWidgetState();
}

class _HiddenTextWidgetState extends State<HiddenTextWidget> {
  bool isTextVisible = true;
  void toggleTextVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                'تفاصيل المنتج',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: toggleTextVisibility,
              child: Icon(
                isTextVisible
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        if (isTextVisible)
           Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.product.description!,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 3,
                textWidthBasis: TextWidthBasis.longestLine,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
      ],
    );
  }
}
