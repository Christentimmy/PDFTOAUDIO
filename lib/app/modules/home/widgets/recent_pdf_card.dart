

import 'package:flutter/material.dart';

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


