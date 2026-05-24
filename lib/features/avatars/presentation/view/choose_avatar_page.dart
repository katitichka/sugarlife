import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';

class ChooseAvatarPage extends StatefulWidget {
  final int currentAvatarId;

  const ChooseAvatarPage({required this.currentAvatarId, super.key});

  @override
  State<ChooseAvatarPage> createState() => _ChooseAvatarPageState();
}

class _ChooseAvatarPageState extends State<ChooseAvatarPage> {
  List<AvatarEntity> _avatars = [];
  int? _selectedId;
  bool _isLoading = true;

  void initState() {
    super.initState();
    _loadAvatars();
  }

  Future<void> _loadAvatars() async {
    print('Начинаю загрузку персонажей...');
    try {
      final repository = context.read<ProfileRepository>();
      final avatars = await repository.getAllAvatars();
      print("Characters: $avatars");
      setState(() {
        _avatars = avatars;
        _selectedId = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print('Ошибка загрузки аватаров: $e');
        _isLoading = false;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  if (_isLoading) {
    return const Scaffold(body: Center(child: LottieProgressIndicator()));
  }

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      toolbarHeight: 90,
      titleSpacing: 0,
      title: Text(
        'Выберите своего аватара',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: GoogleFonts.rubik(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.blue,
        ),
      ),
      leading: const SizedBox(width: 56),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            iconSize: 35,
            color: AppColors.blue,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.cancel),
          ),
        ),
      ],
    ),
    body: Column(
      children: [
        // Сетка аватаров — занимает столько места, сколько нужно, но не больше
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: _avatars.length,
            itemBuilder: (context, index) {
              final avatar = _avatars[index];
              final isSelected = avatar.id == _selectedId;

              return GestureDetector(
                onTap: () => setState(() => _selectedId = avatar.id),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: AppColors.blue,
                            width: 3,
                          )
                        : null,
                  ),
                  child: ClipOval(
                    child: Opacity(
                      opacity: _selectedId == null ? 1.0 : (isSelected ? 1.0 : 0.5),
                      child: SvgPicture.network(
                        avatar.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        placeholderBuilder: (context) => const Center(
                          child: LottieProgressIndicator(),
                        ),
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: ElevatedButton(
            onPressed: _selectedId != null
                ? () {
                    final selectedAvatar = _avatars.firstWhere(
                      (c) => c.id == _selectedId,
                    );
                    Navigator.pop(context, selectedAvatar);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: Colors.white,
              fixedSize: const Size(230, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              textStyle: GoogleFonts.rubik(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            ),
            child: const Text('Готово'),
          ),
        ),
      ],
    ),
  );
}
}
