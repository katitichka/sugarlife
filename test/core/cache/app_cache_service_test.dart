import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/core/cache/app_cache_service.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('восстанавливает достижения после перезапуска приложения', () async {
    final cache = AppCacheService();
    final catalog = [_achievement(1), _achievement(2)];
    final unlocked = [catalog.first.copyWith(isUnlocked: true)];

    await cache.saveAllAchievements(catalog);
    await cache.saveUserAchievements(userId: 'user-id', achievements: unlocked);

    final restoredCache = AppCacheService();

    expect(await restoredCache.getAllAchievements(), catalog);
    expect(await restoredCache.getUserAchievements('user-id'), unlocked);
  });

  test('перезаписывает пользовательский кэш при новой награде', () async {
    final cache = AppCacheService();
    final first = _achievement(1).copyWith(isUnlocked: true);
    final second = _achievement(2).copyWith(isUnlocked: true);

    await cache.saveUserAchievements(userId: 'user-id', achievements: [first]);
    await cache.saveUserAchievement(userId: 'user-id', achievement: second);

    final restored = await AppCacheService().getUserAchievements('user-id');

    expect(restored, [first, second]);
  });

  test('не отдаёт достижения другого пользователя', () async {
    final cache = AppCacheService();
    await cache.saveUserAchievements(
      userId: 'first-user',
      achievements: [_achievement(1).copyWith(isUnlocked: true)],
    );

    expect(await cache.getUserAchievements('second-user'), isNull);
  });
}

AchievementEntity _achievement(int id) {
  return AchievementEntity(
    id: id,
    name: 'Achievement $id',
    description: 'Description $id',
    imageUrl: 'https://example.com/achievement-$id.svg',
    type: AchievementType.daily,
  );
}
