import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sugarlife/core/enum/achievement_type.dart';
import 'package:sugarlife/core/theme/app_colors.dart';
import 'package:sugarlife/features/achievement/domain/entities/achievement_entity.dart';
import 'package:sugarlife/features/achievement/domain/repositories/achievement_repository.dart';
import 'package:sugarlife/features/achievement/presentation/view/achievement_reward_dialog.dart';
import 'package:sugarlife/features/auth/presentation/view/widgets/auth_screen_layout.dart';
import 'package:sugarlife/features/auth/domain/repositories/auth_repository.dart';
import 'package:sugarlife/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/answered_daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';
import 'package:sugarlife/features/daily_card/domain/repositories/daily_card_repository.dart';
import 'package:sugarlife/features/daily_card/presentation/view/daily_card_screen.dart';
import 'package:sugarlife/features/game_module/level/presentation/view/ui/game_level_result_page.dart';
import 'package:sugarlife/features/profile/domain/entities/profile_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/features/profile/presentation/profile_page.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/presentation/ui/theory_list_card.dart';
import 'package:sugarlife/shared/ui/bottom_island.dart';

const _screenSizes = [
  Size(280, 500),
  Size(320, 568),
  Size(568, 320),
  Size(1440, 900),
];

void main() {
  testWidgets('shared layouts fit compact and wide screens', (tester) async {
    _resetViewAfterTest(tester);

    for (final size in _screenSizes) {
      await _pumpAtSize(
        tester,
        size,
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                AuthScreenLayout(
                  children: [
                    const SizedBox(height: 40),
                    const Text('Адаптивная форма'),
                    const SizedBox(height: 20),
                    Container(
                      key: const Key('auth-content-width'),
                      width: double.infinity,
                      height: 300,
                      color: AppColors.primaryTint,
                    ),
                    const Spacer(),
                    const SizedBox(height: 70),
                  ],
                ),
                BottomIsland(currentIndex: 0, onTap: (_) {}),
              ],
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull, reason: 'screen size: $size');
      expect(
        tester.getSize(find.byKey(const Key('auth-content-width'))).width,
        lessThanOrEqualTo(520),
      );
    }
  });

  testWidgets('theory cards fit compact and wide screens', (tester) async {
    _resetViewAfterTest(tester);
    const module = TheoryModuleEntity(
      id: 1,
      title: 'Очень длинное название теоретического модуля',
      subtitle:
          'Подробное описание модуля, которое должно корректно переноситься на узком экране',
      color: AppColors.primaryTint,
      orderIndex: 1,
    );

    for (final size in _screenSizes) {
      await _pumpAtSize(
        tester,
        size,
        const MaterialApp(
          home: Scaffold(body: TheoryListCard(module: module, moduleId: 1)),
        ),
      );

      expect(tester.takeException(), isNull, reason: 'screen size: $size');
      expect(tester.getSize(find.byType(Card)).width, lessThanOrEqualTo(700));
    }
  });

  testWidgets('result and achievement dialogs remain usable at every size', (
    tester,
  ) async {
    _resetViewAfterTest(tester);
    const achievement = AchievementEntity(
      id: 1,
      name: 'Очень длинное название нового достижения',
      description:
          'Подробное описание достижения, которое не должно выходить за границы карточки даже на компактном экране.',
      imageUrl: 'assets/achievements/closed_card.svg',
      type: AchievementType.module,
      isUnlocked: true,
    );

    for (final size in _screenSizes) {
      await _pumpAtSize(
        tester,
        size,
        MaterialApp(
          home: GameLevelResultPage(
            correctAnswers: 3,
            totalQuestions: 5,
            stars: 2,
            onFinish: () {},
            levelId: 1,
            orderIndex: 1,
            theoryModuleId: 1,
          ),
        ),
      );
      expect(
        tester.takeException(),
        isNull,
        reason: 'result screen size: $size',
      );

      await _pumpAtSize(
        tester,
        size,
        const MaterialApp(
          home: Scaffold(
            body: AchievementRewardDialog(achievement: achievement),
          ),
        ),
      );
      expect(
        tester.takeException(),
        isNull,
        reason: 'achievement dialog size: $size',
      );
    }
  });

  testWidgets('daily card dialog scrolls instead of overflowing', (
    tester,
  ) async {
    _resetViewAfterTest(tester);

    for (final size in _screenSizes) {
      await _pumpAtSize(
        tester,
        size,
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<DailyCardRepository>(
              create: (_) => _DailyCardRepository(),
            ),
            RepositoryProvider<AchievementRepository>(
              create: (_) => _AchievementRepository(),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: DailyCardScreen(key: ValueKey(size))),
          ),
        ),
      );

      await tester.pump();
      expect(tester.takeException(), isNull, reason: 'screen size: $size');
    }
  });

  testWidgets('daily card loading state is full-size and explicit', (
    tester,
  ) async {
    _resetViewAfterTest(tester);

    for (final size in _screenSizes) {
      final repository = _LoadingDailyCardRepository();
      await _pumpAtSize(
        tester,
        size,
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<DailyCardRepository>.value(value: repository),
            RepositoryProvider<AchievementRepository>(
              create: (_) => _AchievementRepository(),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: DailyCardScreen(key: ValueKey(repository))),
          ),
        ),
      );

      expect(find.text('Ежедневная карточка'), findsOneWidget);
      expect(find.text('Загружаем новый факт…'), findsOneWidget);
      expect(
        tester.getSize(find.byKey(const Key('daily-card-loading'))).width,
        greaterThanOrEqualTo(180),
      );
      expect(tester.takeException(), isNull, reason: 'screen size: $size');

      repository.complete();
      await tester.pump();
    }
  });

  testWidgets('profile content fits compact and wide screens', (tester) async {
    _resetViewAfterTest(tester);

    for (final size in _screenSizes) {
      await _pumpAtSize(
        tester,
        size,
        RepositoryProvider<ProfileRepository>(
          create: (_) => _ProfileRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    AuthBloc(authRepository: _AuthRepository())
                      ..add(const AuthEvent.authCheckStarted()),
              ),
              BlocProvider(
                create: (_) => AchievementBloc(
                  achievementRepository: _AchievementRepository(),
                ),
              ),
            ],
            child: const MaterialApp(home: ProfilePage()),
          ),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull, reason: 'screen size: $size');
    }

    await tester.pumpWidget(const SizedBox.shrink());
  });
}

void _resetViewAfterTest(WidgetTester tester) {
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetPhysicalSize);
}

Future<void> _pumpAtSize(WidgetTester tester, Size size, Widget widget) async {
  tester.view.physicalSize = size;
  await tester.pumpWidget(widget);
  await tester.pump(const Duration(milliseconds: 100));
}

class _DailyCardRepository implements DailyCardRepository {
  static const card = DailyCardEntity(
    id: 1,
    question:
        'Правда ли, что длинный текст вопроса должен полностью помещаться в диалоге на любом экране?',
    isMyth: false,
    explanation: 'Explanation',
    dayNumber: 1,
  );

  @override
  Future<DailyCardEntity?> getTodayCard() async => card;

  @override
  Future<bool> hasAnsweredToday() async => false;

  @override
  Future<AnsweredDailyCardEntity?> getAnsweredCardForToday() async => null;

  @override
  Future<List<bool>> getAnswerHistory() async => const [];

  @override
  Future<void> saveUserAnswer(int cardId, bool isCorrect) async {}
}

class _LoadingDailyCardRepository extends _DailyCardRepository {
  final Completer<DailyCardEntity?> _completer = Completer();

  @override
  Future<DailyCardEntity?> getTodayCard() => _completer.future;

  void complete() => _completer.complete(_DailyCardRepository.card);
}

class _AchievementRepository implements AchievementRepository {
  @override
  Future<List<AchievementEntity>> getAllAchievements() async => const [];

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

class _AuthRepository implements AuthRepository {
  static const profile = ProfileEntity(
    id: 'user-id',
    username: 'Очень длинное имя пользователя для проверки адаптивности',
    currentAvatarId: 1,
  );

  @override
  Future<ProfileEntity?> getCurrentUser() async => profile;

  @override
  Future<void> logout() async {}

  @override
  Future<ProfileEntity> signIn({
    required String email,
    required String password,
  }) async => profile;

  @override
  Future<ProfileEntity> signUp({
    required String email,
    required String password,
    required String username,
  }) async => profile;
}

class _ProfileRepository implements ProfileRepository {
  @override
  Future<List<AvatarEntity>> getAllAvatars() async => const [];

  @override
  Future<String> getAvatarUrl(int avatarId) async => '';

  @override
  Future<void> updateAvatar(int avatarId) async {}

  @override
  Future<void> updateUsername(String newUsername) async {}
}
