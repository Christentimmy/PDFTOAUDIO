import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/audio_player/views/audio_player_screen.dart';
import 'package:pdftoaudio/app/utils/extract_text.dart';
import 'package:pdftoaudio/app/utils/pick_file.dart';

class AudioController extends GetxController {
  final RxString _pdfText = "".obs;

  RxString get pdfText => _pdfText;
  final FlutterTts _flutterTts = FlutterTts();
  FlutterTts get flutterTts => _flutterTts;
  RxBool isloading = false.obs;

  Future<void> pickAndExtractText() async {
    isloading.value = true;
    try {
      final path = await pickPdf();
      if (path == null) return;
      String? extractedText = await extractTextFromPdf(path);
      if (extractedText == null) return;
      _pdfText.value = extractedText;
      Get.to(() => const AudioPlayerScreen());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> speakText({required String text}) async {
    try {
      if (_pdfText.isEmpty) return;
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.speak(_pdfText.value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
