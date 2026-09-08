import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';

void main() {
  test(
    'loadAchievements keeps all achievements and marks unlocked ones',
    () async {
      final allAchievements = [
        _achievement(1),
        _achievement(2),
        _achievement(3),
      ];
      final repository = _AchievementRepository(
        allAchievements: allAchievements,
        userAchievements: [allAchievements[1].copyWith(isUnlocked: true)],
      );
      final bloc = AchievementBloc(achievementRepository: repository);

      bloc.add(const AchievementEvent.loadAchievements());

      await expectLater(
        bloc.stream,
        emits(
          isA<AchievementState>().having(
            (state) =>
                state.achievements.map((item) => item.isUnlocked).toList(),
            'unlock states',
            [false, true, false],
          ),
        ),
      );
      await bloc.close();
    },
  );
}

AchievementEntity _achievement(int id) {
  return AchievementEntity(
    id: id,
    name: 'Achievement $id',
    description: 'Description $id',
    imageUrl: 'achievement-$id.svg',
    type: AchievementType.module,
  );
}

class _AchievementRepository implements AchievementRepository {
  _AchievementRepository({
    required this.allAchievements,
    required this.userAchievements,
  });

  final List<AchievementEntity> allAchievements;
  final List<AchievementEntity> userAchievements;

  @override
  Future<List<AchievementEntity>> getAllAchievements() async => allAchievements;

  @override
  Future<List<AchievementEntity>> getUserAchievements() async =>
      userAchievements;

  @override
  Future<AchievementEntity?> getPendingAchievement() async => null;

  @override
  Future<void> markAchievementCardShown({required int achievementId}) async {}

  @override
  Future<AchievementEntity?> unlockRandomAchievement({
    required AchievementType type,
  }) async => null;
}
