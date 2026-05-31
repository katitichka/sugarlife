import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/achievement/presentation/bloc/achievement_bloc.dart';

class AchievementsSection extends StatefulWidget {
  const AchievementsSection({super.key});

  @override
  State<AchievementsSection> createState() => _AchievementsSectionState();
}

class _AchievementsSectionState extends State<AchievementsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementBloc, AchievementState>(
      builder: (context, achievementState) {
        final achievements = achievementState.achievements;
        final totalAchievements = achievements.length;
        _totalPages = (totalAchievements / 2).ceil();
        if (_totalPages == 0) _totalPages = 1;

        if (_currentPage >= _totalPages) {
          _currentPage = _totalPages - 1;
          if (_currentPage < 0) _currentPage = 0;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Левая стрелка
                if (_totalPages > 1)
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: AppColors.white,
                      size: 35,
                    ),
                    onPressed: _currentPage > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        : null,
                  )
                else
                  const SizedBox(width: 35),

                // Список достижений
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemCount: _totalPages,
                      itemBuilder: (context, pageIndex) {
                        final startIndex = pageIndex * 2;
                        final endIndex = startIndex + 2;
                        final pageAchievements =
                            achievements.length > startIndex
                            ? achievements.sublist(
                                startIndex,
                                endIndex > achievements.length
                                    ? achievements.length
                                    : endIndex,
                              )
                            : [];

                        final displayItems = List.generate(2, (index) {
                          if (index < pageAchievements.length) {
                            return pageAchievements[index];
                          }
                          return null;
                        });

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(displayItems.length, (index) {
                            final achievement = displayItems[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: achievement != null
                                        ? _AchievementIcon(
                                            url: achievement.imageUrl,
                                          )
                                        : const _AchievementPlaceholderCard(),
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),

                // Правая стрелка
                if (_totalPages > 1)
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: AppColors.white,
                      size: 35,
                    ),
                    onPressed: _currentPage < _totalPages - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        : null,
                  )
                else
                  const SizedBox(width: 35),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AchievementPlaceholderCard extends StatelessWidget {
  const _AchievementPlaceholderCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min, 
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SvgPicture.asset(
              'assets/achievements/plug.svg',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  const _AchievementIcon({required this.url});

  final String url;

  static Widget _placeholder() => Column(
    mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 100,
        height: 100,
        child: SvgPicture.asset(
          'assets/achievements/plug.svg',
          width: 100,
          height: 100,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
    ],
  );

   @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (url.toLowerCase().endsWith('.svg'))
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SvgPicture.network(
                url,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                placeholderBuilder: (_) => _placeholder(),
              ),
            ),
          )
        else
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: url,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                placeholder: (_, __) => _placeholder(),
                errorWidget: (_, __, ___) => _placeholder(),
              ),
            ),
          ),
      ],
    );
  }

}
