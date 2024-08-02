import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.image,
    required this.semanticLabel,
  });

  final String image;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.tmdb.org/t/p/w185$image',
      fit: BoxFit.cover,
      semanticLabel: semanticLabel,
    );
  }
}
