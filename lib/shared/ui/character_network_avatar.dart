import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Определяет SVG по пути URL (без учёта query), а не по всей строке.
bool isNetworkSvgUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
    return false;
  }
  return uri.path.toLowerCase().endsWith('.svg');
}

/// Сетевой аватар персонажа: SVG через [SvgPicture.network], растр через [CachedNetworkImage].
class CharacterNetworkAvatar extends StatelessWidget {
  const CharacterNetworkAvatar({
    super.key,
    required this.imageUrl,
    required this.size,
    this.fit = BoxFit.cover,
    this.loadingIndicatorColor,
    this.loadingIndicatorStrokeWidth = 2,
    this.errorIconColor,
  });

  final String imageUrl;
  final double size;
  final BoxFit fit;
  final Color? loadingIndicatorColor;
  final double loadingIndicatorStrokeWidth;
  final Color? errorIconColor;

  Widget _loading() => Center(
    child: SizedBox(
      width: size * 0.35,
      height: size * 0.35,
      child: CircularProgressIndicator(
        strokeWidth: loadingIndicatorStrokeWidth,
        color: loadingIndicatorColor,
      ),
    ),
  );

  Widget _error() => Center(
    child: Icon(
      Icons.error_outline,
      size: (size * 0.32).clamp(24.0, 48.0),
      color: errorIconColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (imageUrl.trim().isEmpty) {
      return _error();
    }
    if (isNetworkSvgUrl(imageUrl)) {
      return SvgPicture.network(
        imageUrl,
        width: size,
        height: size,
        fit: fit,
        placeholderBuilder: (_) => _loading(),
        errorBuilder: (_, __, ___) => _error(),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: fit,
      placeholder: (_, __) => _loading(),
      errorWidget: (_, __, ___) => _error(),
    );
  }
}
