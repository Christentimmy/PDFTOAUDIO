import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/onboarding/views/onboarding_screen.dart';

class SplashController extends GetxController {
  void initializeSplash() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(() => OnboardingScreen());
    });
  }
}
