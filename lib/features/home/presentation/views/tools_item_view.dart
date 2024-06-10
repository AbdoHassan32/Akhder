import 'package:akhder/core/utils/styles.dart';
import 'package:akhder/features/home/presentation/views/widgets/tools_item_view_body.dart';
import 'package:flutter/material.dart';

class ToolsItemView extends StatelessWidget {
  const ToolsItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'المعدات الزراعية',
          textDirection: TextDirection.rtl,
          style: Styles.textStyle20,
        ),
      ),
      body: const ToolsItemViewBody(),
    );
  }
}
