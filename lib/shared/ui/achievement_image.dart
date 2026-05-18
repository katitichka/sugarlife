import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';

/// Отображает изображение достижения (локальный asset, SVG или PNG из сети).
class AchievementImage extends StatelessWidget {
  const AchievementImage({
    super.key,
    required this.imageUrl,
    this.width = 140,
    this.height = 140,
    this.fit = BoxFit.contain,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  static const _placeholderAsset = 'assets/achievements/placeholder.png';

  static Widget placeholder({double width = 140, double height = 140}) {
    return Image.asset(
      _placeholderAsset,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Предзагружает изображение достижения перед показом диалога.
  static Future<void> precache(String url, BuildContext context) async {
    if (url.isEmpty || !_isNetworkUrl(url)) return;

    await loadWithRetry(
      () async {
        if (url.toLowerCase().endsWith('.svg')) {
          await SvgNetworkLoader(url).loadBytes(null);
        } else {
          if (!context.mounted) return;
          await precacheImage(CachedNetworkImageProvider(url), context);
        }
      },
      maxAttempts: 2,
      perAttemptTimeout: const Duration(seconds: 8),
    );
  }

  static bool _isNetworkUrl(String path) =>
      path.startsWith('http://') || path.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return placeholder(width: width, height: height);
    }

    if (!_isNetworkUrl(imageUrl)) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) =>
            placeholder(width: width, height: height),
      );
    }

    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) =>
            placeholder(width: width, height: height),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) => SizedBox(
        width: width,
        height: height,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (_, __, ___) => placeholder(width: width, height: height),
    );
  }
}
