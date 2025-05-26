import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_api/core/const/image_constants.dart';
class CharacterImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CharacterImage({
    super.key,
    required this.imageUrl,
    this.width = 50.0,
    this.height = 70.0,
  });

  @override
  Widget build(BuildContext context) {
    final isValid = imageUrl.isNotEmpty;

    return CachedNetworkImage(
      imageUrl: isValid ? imageUrl : ImageConstants.defaultCharacter,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const CircularProgressIndicator(strokeWidth: 2),
      errorWidget: (context, url, error) => Image.network(
        ImageConstants.defaultCharacter,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
