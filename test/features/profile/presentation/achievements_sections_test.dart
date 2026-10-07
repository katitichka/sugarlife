import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/profile/presentation/achievements_sections.dart';

void main() {
  testWidgets('achievements fit narrow and wide screens without overflow', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    for (final size in const [
      Size(280, 568),
      Size(320, 568),
      Size(1440, 900),
    ]) {
      tester.view.physicalSize = size;

      await tester.pumpWidget(
        BlocProvider(
          create: (_) =>
              AchievementBloc(achievementRepository: _AchievementRepository())
                ..add(const AchievementEvent.loadAchievements()),
          child: const MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AchievementsSection(),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull, reason: 'screen size: $size');
    }
  });
}

class _AchievementRepository implements AchievementRepository {
  @override
  Future<List<AchievementEntity>> getAllAchievements() async => List.generate(
    6,
    (index) => AchievementEntity(
      id: index + 1,
      name: 'Achievement ${index + 1}',
      description: 'Description ${index + 1}',
      imageUrl: 'achievement-${index + 1}.svg',
      type: AchievementType.module,
    ),
  );

  @override
  Future<List<AchievementEntity>> getUserAchievements() async => const [];

  @override
  Future<AchievementEntity?> getPendingAchievement() async => null;

  @override
  Future<void> markAchievementCardShown({required int achievementId}) async {}

  @override
  Future<AchievementEntity?> unlockRandomAchievement({
    required AchievementType type,
  }) async => null;
}
