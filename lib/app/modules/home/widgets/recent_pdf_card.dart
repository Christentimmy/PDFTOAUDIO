import 'package:flutter/material.dart';

class RecentPDFCard extends StatelessWidget {
  const RecentPDFCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 110,
      margin: const EdgeInsets.only(right: 15, left: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 5,
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(top: 10, right: 10, child: Icon(Icons.menu)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pdflogo.png",
                height: 50,
              ),
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
