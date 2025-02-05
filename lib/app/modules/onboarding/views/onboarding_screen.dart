import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/home/views/home_screen.dart';
import 'package:pdftoaudio/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:pdftoaudio/app/widget/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _onboardingController.onboardingList.length,
              itemBuilder: (context, index) {
                String imageUrl =
                    _onboardingController.onboardingList[index][0];
                String title = _onboardingController.onboardingList[index][1];
                String subTitle =
                    _onboardingController.onboardingList[index][2];
                return SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Stack(
                    children: [
                      Image.network(
                        imageUrl,
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: Get.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
              onTap: () {
                Get.to(() => HomeScreen());
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.05),
        ],
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Stack(
    //       children: [
    //         Expanded(
    //           child: PageView.builder(
    //             itemCount: _onboardingController.onboardingList.length,
    //             itemBuilder: (context, index) {
    //               String imageUrl =
    //                   _onboardingController.onboardingList[index][0];
    //               String title =
    //                   _onboardingController.onboardingList[index][1];
    //               String subTitle =
    //                   _onboardingController.onboardingList[index][2];
    //               return Column(
    //                 children: [
    //                   Image.network(
    //                     imageUrl,
    //                     fit: BoxFit.cover,
    //                     width: Get.width,
    //                     height: Get.height,
    //                   ),
    //                 ],
    //               );
    //             },
    //           ),
    //         ),
    //         Container(
    //           width: Get.width,
    //           height: Get.height,
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               colors: [
    //                 Colors.transparent,
    //                 Colors.black.withOpacity(0.4),
    //               ],
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //             ),
    //           ),
    //         ),
    //         Column(
    //           children: [
    //             const SizedBox(height: 20),
    //             Text(
    //               "title",
    //               style: const TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //             ),
    //             const SizedBox(height: 20),
    //             Text(
    //               "subTitle",
    //               style: TextStyle(
    //                 fontSize: 15,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.grey.shade400,
    //               ),
    //             ),
    //           ],
    //         ),
    //         Positioned(
    //           bottom: 0,
    //           child: CustomButton(
    //             onTap: () {
    //               // Get.to(()=>);
    //             },
    //             child: const Text(
    //               "Get Started",
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
