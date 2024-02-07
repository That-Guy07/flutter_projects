import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  State<FavoriteIcon> createState() {
    return _FavoriteIconState();
  }
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = widget.isFavorite;

    return Icon(
      isFavorite ? Icons.star : Icons.star_border,
    );
  }
}
