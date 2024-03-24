import 'package:flutter/material.dart';

class HiddenTextWidget extends StatefulWidget {
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
        if (isTextVisible)
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'تمت صياغته بعناية ،معبأة مع مجموعة من الخيرات ،تغليف صحي،راجع العبوة للحصول علي معلومات حول الاستخدام',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 2,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
      ],
    );
  }
}
