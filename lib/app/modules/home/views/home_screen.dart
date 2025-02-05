import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class RecentPDFCard extends StatelessWidget {
  const RecentPDFCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: 10,
            right: 10,
            child: Text(
              "file.txt",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Column(
            children: [
              Image.asset("assets/images/pdflogo.png"),
              const SizedBox(height: 10),
              const Text(
                "Files.pdf",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
