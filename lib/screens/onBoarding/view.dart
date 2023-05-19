
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helper/cache_helper.dart';
import '../../utils/color_manager.dart';
import '../sign_in/view.dart';
import 'package:detict_age/utils/color_manager.dart';


class BoardingModel {
  final String image;

  final String title;

  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    // BoardingModel(
    //     image: 'assets/images/mri.png',
    //     title: """Magnetic Resonance Imaging
    //      """,
    //     body:
    //         """MRI machine works to detect the brain by scanning cells, then the diagnosis is made on these rays by specialists"""),
    BoardingModel(
        image: 'assets/images/onboard1.jpg',
        title: """Why is this app important?
         """,
        body:
"""It provides an accurate estimation of children's age, which helps in medical diagnosis .
Contributes to achieving justice in legal and immigration cases by determining the exact age of children.
Children's Affairs promotes the illegal sex trade.
Adopts advanced medical imaging technology and human intelligence, improving accuracy and objectivity in age estimation."""),
    BoardingModel(
        image: 'assets/images/onboard2.jpg',
        title: """Application function
    """,
        body:
            """Image upload: Users can upload X-ray images of children for analysis.
Age estimation: The application uses advanced algorithms to estimate the age of children based on the analysis of X-ray images.
Age report: A detailed report is generated, providing the estimated age of the child.
User-friendly interface: The application provides an intuitive interface for easy navigation and efficient use."""),
  ];

  PageController boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    double myHight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
        backgroundColor: ColorManager.white,
        //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                      (route) => false);
                  // save shardpref file >> false
                  CacheHelper.writeFirstTime(key: "isFirstTime", value: false);
                },
                child:  Text(
                  'SKIP',
                  style: TextStyle(color: ColorManager.primary),
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PageView.builder(
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                        // print('last');
                      });
                    } else {
                      setState(() {
                        isLast = false;
                        // print("not last");
                      });
                    }
                  },
                  itemBuilder: (context, index) => buildBoardingItem(
                      model: boarding[index], myHight: myHight),
                  itemCount: boarding.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SmoothPageIndicator(
                      controller: boardController, // PageController
                      count: boarding.length,
                      effect: ScrollingDotsEffect(
                        dotColor: Color(0xFFB7CADB),
                        activeDotColor: Color(0xFF1A132F),
                        dotHeight: 10,
                        dotWidth: 10,

                        //expansionFactor: 4.0,
                        spacing: 8.0,
                      ), // your preferred effect
                      onDotClicked: (index) {}),
                  SizedBox(
                    height: 30,
                  ),
                  // Spacer(),
                  Container(
                    padding: EdgeInsetsDirectional.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        //onPrimary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        fixedSize: const Size.fromHeight(63),
                      ),
                      onPressed: () {
                        if (isLast) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                              (route) => false);
                          // save shardpref file >> false
                          CacheHelper.writeFirstTime(
                              key: "isFirstTime", value: false);
                        } else {
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: isLast
                          ? const Text(
                              "  Get Started  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // fontStyle: FontStyle.italic
                              ),
                            )
                          : const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white
                        ,
                              size: 25,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget buildBoardingItem(
          {required BoardingModel model, required double myHight}) =>
      Padding(padding: const EdgeInsets.only(top: 20.0 ,bottom: 20,right: 20 ,left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage(model.image),
                  height: myHight * 0.7,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Text(
                  model.body,
                  maxLines: 11,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,overflow: TextOverflow.ellipsis,),
                ),
              ),

            ],
          ),
        ),
      );
}
