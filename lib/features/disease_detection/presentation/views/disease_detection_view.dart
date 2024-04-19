import 'package:akhder/features/disease_detection/presentation/views/widgets/disease_detection_view_body.dart';
import 'package:flutter/material.dart';

class DiseaseDetectionView extends StatelessWidget {
  const DiseaseDetectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: DiseaseDetectionViewBody(),
    );
  }
}
