import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:pdftoaudio/app/widget/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final _onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: _onboardingController.onboardingList.length,
                  itemBuilder: (context, index) {
                    String imageUrl =
                        _onboardingController.onboardingList[index][0];
                    String title =
                        _onboardingController.onboardingList[index][1];
                    String subTitle =
                        _onboardingController.onboardingList[index][2];
                    return Column(
                      children: [
                        Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: Get.width,
                          height: Get.height,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: CustomButton(
                  onTap: (){
                    // Get.to(()=>);
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
