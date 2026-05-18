import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/errors/error_mapper.dart';
import 'package:sugarlife/core/errors/error_messages.dart';
import 'package:sugarlife/core/errors/load_with_retry.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/avatars/domain/entities/avatar_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/shared/ui/app_error_view.dart';

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
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _loadAvatars();
  }

  Future<void> _loadAvatars() async {
    setState(() {
      _isLoading = true;
      _loadError = null;
    });
    try {
      final repository = context.read<ProfileRepository>();
      final avatars = await loadWithRetry(repository.getAllAvatars);
      if (!mounted) return;
      await _precacheAvatarImages(context, avatars);
      if (!mounted) return;
      setState(() {
        _avatars = avatars;
        _selectedId = null;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadError = ErrorMapper.toUserMessage(
          e,
          loadContext: ErrorMessages.loadFailed,
        );
        _isLoading = false;
      });
    }
  }

  Future<void> _precacheAvatarImages(
    BuildContext context,
    List<AvatarEntity> avatars,
  ) async {
    await Future.wait(
      avatars.map((avatar) {
        final loader = SvgNetworkLoader(avatar.imageUrl);
        return loader.loadBytes(context);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_loadError != null) {
      return Scaffold(
        body: AppErrorView(
          message: _loadError!,
          wrapInScaffold: false,
          onRetry: _loadAvatars,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 90,
        titleSpacing: 0, // Убирает отступы по бокам
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
        leading: const SizedBox(width: 56), // Пустое место шириной с иконку
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 450,
              width: 320,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: _avatars.length,
                itemBuilder: (context, index) {
                  final avatar = _avatars[index];
                  final isSelected = avatar.id == _selectedId;

                  return GestureDetector(
                    onTap: () => setState(() => _selectedId = avatar.id),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border.all(color: AppColors.blue, width: 3)
                            : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Opacity(
                        opacity: _selectedId == null ? 1.0 : (isSelected ? 1.0 : 0.5),
                        child: SvgPicture.network(
                          avatar.imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed:
                  _selectedId != null 
                  ? () {
                      final selectedAvatar = _avatars.firstWhere(
                        (c) => c.id == _selectedId,
                      );
                      Navigator.pop(context, selectedAvatar);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue, // Цвет фона кнопки
                foregroundColor: Colors.white, // Цвет текста
                fixedSize: const Size(230, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90), // Скругление углов
                ),
                textStyle: GoogleFonts.rubik(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: Text('Готово'),
            ),
          ],
        ),
      ),
    );
  }
}
