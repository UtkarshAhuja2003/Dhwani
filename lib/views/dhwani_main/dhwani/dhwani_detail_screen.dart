import 'package:dhwani/views/dhwani_main/dhwani/image_view.dart';
import 'package:flutter/material.dart';

class DhwaniDetailScreen extends StatelessWidget {
  const DhwaniDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          const ImageView(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Scrollable Text Here', // Example long text
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
