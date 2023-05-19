import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../utils/assets_manager.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title:  Text("Language",style: TextStyle()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.splashLogo,
                      width: 20,
                    ),
                    SizedBox(width: 10,),
                    Text("about".tr())
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Text(""" Bone age assessment using hand-wrist X-ray images is fundamental when diagnosing growth disorders of a child or providing a more patient-specific treatment. However, as clinical procedures are a subjective assessment, the accuracy depends highly on the doctor’s experience. Motivated by this, a deep learning-based computer-aided diagnosis method was proposed for performing bone age assessment. Inspired by clinical approaches and aimed to reduce expensive manual annotations, informative regions localization based on a complete unsupervised learning method was firstly performed and an image-processing pipeline was proposed. Subsequently, an image model with pre-trained weights as a backbone was utilized to enhance the reliability of prediction. The prediction head was implemented by a Multiple Layer Perceptron with one hidden layer. In compliance with clinical studies, gender information was an additional input to the prediction head by embedded into the feature vector calculated from the backbone model. After the experimental comparison study, the best results showed a mean absolute error of 6.2 months on the public RSNA dataset and 5.1 months on the additional dataset using MobileNetV3 as the backbone.
""")


            ],
          ),
        ),
      ),
    );
  }
}
