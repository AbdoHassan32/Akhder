import 'package:akhder/features/irregation/presentation/views/widgets/irrigation_view_body.dart';
import 'package:flutter/material.dart';

class IrrigationView extends StatelessWidget {
  const IrrigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: IrrigationViewBody()),
    );
  }
}
