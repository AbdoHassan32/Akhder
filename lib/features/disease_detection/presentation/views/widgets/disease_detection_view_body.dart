import 'package:akhder/core/utils/assets.dart';
import 'package:akhder/core/widgets/custom_button_widget.dart';
import 'package:akhder/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:akhder/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/background_image_widget.dart';

class DiseaseDetectionViewBody extends StatefulWidget {
  const DiseaseDetectionViewBody({Key? key}) : super(key: key);

  @override
  State<DiseaseDetectionViewBody> createState() =>
      _DiseaseDetectionViewBodyState();
}

class _DiseaseDetectionViewBodyState extends State<DiseaseDetectionViewBody> {
  PlatformFile? imagePicked;
  bool imageSelected = false;
  late List results = [];

  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result == null) return;
      setState(() {
        imagePicked = result.files.first;
        imageSelected = true;
      });
      imageCalassification(imagePicked!);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  Future<void> imageCalassification(PlatformFile image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path!,
      numResults: 1,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      results = recognitions!;
    });
  }
  Future loadModel() async {
    Tflite.close();
    try {
      String res;
      res = (await Tflite.loadModel(
        model: "assets/model/model2.tflite",
        labels: "assets/model/labels2.txt",
      ))!;
      print(res);
    } on PlatformException {
      print('Failed to load model.');
    }
  }
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 40,
          ),
          child: imagePicked != null
              ? Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          iconSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.memory(
                            Uint8List.fromList(imagePicked!.bytes!),
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.35,
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: (imageSelected)? results.map((results){
                        return Card(
                          child: Container(
                            child: Text(' اسم المرض : ${results['label']}\n نسبة التأكيد : ${(results['confidence']*100).toStringAsFixed(2)} % ',
                              textDirection: TextDirection.rtl,
                              style: Styles.textStyle18,
                            ),
                          ),
                        );


                      }).toList() : [],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    CustomButtonWidget(
                        buttonColor: kPrimaryColor,
                        label: 'افحص مرة اخرى',
                        onPressed: () {
                          pickImage();
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
              : Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          iconSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        AssetsData.disease_detection,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'افحص نباتك',
                      style: Styles.textStyle26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'ارفع صورة للنبات الخاص بك لفحصه',
                      style: Styles.textStyle16,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomButtonWidget(
                        buttonColor: kPrimaryColor,
                        label: 'افحص',
                        onPressed: () {
                          pickImage();
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
