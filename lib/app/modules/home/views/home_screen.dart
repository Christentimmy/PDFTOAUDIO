import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdftoaudio/app/modules/home/widgets/recent_pdf_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Column(
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
              "Christen Dev",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
            radius: 25,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              Image.asset(
                "assets/images/ads.png",
                width: Get.width,
                fit: BoxFit.cover,
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
                  itemBuilder: (context, index) {
                    return RecentPDFCard();
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text("Select File"),
                trailing: Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
