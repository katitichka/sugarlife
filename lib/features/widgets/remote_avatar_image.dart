import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoteAvatarImage extends StatefulWidget {
  const RemoteAvatarImage({
    required this.url,
    required this.fit,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
    super.key,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  State<RemoteAvatarImage> createState() => _RemoteAvatarImageState();
}

class _RemoteAvatarImageState extends State<RemoteAvatarImage> {
  late Future<Widget> _future;

  static final RegExp _embeddedRasterRegExp = RegExp(
    r'data:image/(?:png|jpeg|jpg|webp);base64,([^"]+)',
    caseSensitive: false,
  );

  @override
  void initState() {
    super.initState();
    _future = _loadAvatar();
  }

  @override
  void didUpdateWidget(covariant RemoteAvatarImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _future = _loadAvatar();
    }
  }

  Future<Widget> _loadAvatar() async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 12);
    try {
      final request = await client
          .getUrl(Uri.parse(widget.url))
          .timeout(const Duration(seconds: 12));
      final response = await request.close().timeout(const Duration(seconds: 12));
      if (response.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Failed to load avatar: ${response.statusCode}',
          uri: Uri.parse(widget.url),
        );
      }

      final svgRaw = await utf8
          .decodeStream(response)
          .timeout(const Duration(seconds: 12));
      final rasterMatch = _embeddedRasterRegExp.firstMatch(svgRaw);
      if (rasterMatch != null) {
        final base64Content = rasterMatch.group(1)!.replaceAll(
          RegExp(r'\s+'),
          '',
        );
        return Image.memory(
          base64Decode(base64Content),
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          filterQuality: FilterQuality.high,
        );
      }
      return SvgPicture.string(
        svgRaw,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      );
    } finally {
      client.close(force: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return widget.placeholder ??
              const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return widget.errorWidget ?? const Icon(Icons.error);
        }
        return snapshot.data!;
      },
    );
  }
}
