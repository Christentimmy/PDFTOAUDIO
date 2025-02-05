import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/audio_player/controller/audio_controller.dart';
import 'package:pdftoaudio/app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:pdftoaudio/app/modules/splash/controller/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(OnboardingController());
    Get.put(AudioController());
  }
}
