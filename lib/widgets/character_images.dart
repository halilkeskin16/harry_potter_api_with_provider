import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_api/core/const/image_constants.dart';
class CharacterImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CharacterImage({
    super.key,
    required this.imageUrl,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    final isValid = imageUrl.isNotEmpty;

    return CachedNetworkImage(
      imageUrl: isValid ? imageUrl : ImageConstants.defaultCharacter,
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const CircularProgressIndicator(strokeWidth: 2),
      errorWidget: (context, url, error) => Image.network(
        ImageConstants.defaultCharacter,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
