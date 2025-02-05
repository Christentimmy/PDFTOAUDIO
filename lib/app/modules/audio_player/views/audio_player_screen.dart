import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/audio_player/controller/audio_controller.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen>
    with SingleTickerProviderStateMixin {
  final _audioController = Get.find<AudioController>();

  late AnimationController _controller;
  RxBool isPlaying = false.obs;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 500),
    );
  }

  void _toggleIcon() {
    if (isPlaying.value) {
      _audioController.flutterTts.pause();
      _controller.reverse();
    } else {
      _audioController.speakText(text: _audioController.pdfText.value);
      _controller.forward();
    }
    isPlaying.value = !isPlaying.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final RxDouble _speechRate = 0.5.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          'Audio Player',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _audioController.pdfText.isEmpty
                      ? ""
                      : _audioController.pdfText.value,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  iconSize: 22,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _controller,
                    color: Colors.black,
                  ),
                  onPressed: _toggleIcon,
                ),
              ),
            ),
            Obx(
              () => DropdownButton<double>(
                value: _speechRate.value,
                dropdownColor: const Color.fromARGB(255, 27, 27, 27),
                items: [0.5, 1.0, 1.5, 2.0]
                    .map((rate) => DropdownMenuItem(
                          value: rate,
                          child: Text(
                            "Speed: ${rate}x",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) async {
                  _speechRate.value = value!;
                  await _audioController.flutterTts.setSpeechRate(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
