import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nayon_test/app_config.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${AppConfig.DOMAIN}/$src",
      fit: BoxFit.cover,
      height: 100,
      width: 100,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
