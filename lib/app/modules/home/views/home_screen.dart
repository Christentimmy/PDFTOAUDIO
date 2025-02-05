import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/audio_player/controller/audio_controller.dart';
import 'package:pdftoaudio/app/modules/home/widgets/recent_pdf_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _audioController = Get.find<AudioController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.01),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Test User",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avater.png"),
                    radius: 25,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.05),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/ads.jpg",
                  width: Get.width,
                  fit: BoxFit.cover,
                  height: Get.height * 0.12,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              const Text(
                "Recent Files",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Center(
                      child: RecentPDFCard(),
                    );
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Obx(
                () => _audioController.isloading.value
                    ? const LinearProgressIndicator(
                        color: Colors.white,
                      )
                    : ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Text(
                          "Select File",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                        ),
                        onTap: () async {
                          await _audioController.pickAndExtractText();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
