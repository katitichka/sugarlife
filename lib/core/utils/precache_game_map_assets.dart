import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _gameMapAssetPaths = [
  'assets/images/repeat_background.svg',
  'assets/images/start_background.svg',
  'assets/levels/completed_level.svg',
  'assets/levels/current_level.svg',
  'assets/levels/new_level.svg',
  'assets/common/daily_icon.svg',
];

bool _areGameMapAssetsPrecached = false;

bool get areGameMapAssetsPrecached => _areGameMapAssetsPrecached;

Future<void> precacheGameMapAssets(BuildContext context) async {
  if (_areGameMapAssetsPrecached) return;

  await Future.wait(
    _gameMapAssetPaths.map((path) => SvgAssetLoader(path).loadBytes(context)),
  );
  _areGameMapAssetsPrecached = true;
}
