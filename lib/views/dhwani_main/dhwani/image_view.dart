import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageProvider = const AssetImage('assets/speech-mechanism.png');
    Alignment targetZoomPoint = const Alignment(10, 10);

    return Container(
      width: double.infinity,
      height: 3000,
      child: PhotoView(
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        imageProvider: imageProvider,
        initialScale: PhotoViewComputedScale.covered,
        basePosition: targetZoomPoint,
      ),
    );
  }
}

