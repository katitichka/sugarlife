import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';
import 'package:sugarlife/features/widgets/remote_avatar_image.dart';

class ChooseCharacterPage extends StatefulWidget {
  final int currentAvatarId;

  const ChooseCharacterPage({required this.currentAvatarId, super.key});

  @override
  State<ChooseCharacterPage> createState() => _ChooseCharacterPageState();
}

class _ChooseCharacterPageState extends State<ChooseCharacterPage> {
  List<CharacterEntity> _characters = [];
  int? _selectedId;
  bool _isLoading = true;

  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    print('Начинаю загрузку персонажей...');
    try {
      final repository = context.read<ProfileRepository>();
      final characters = await repository.getAllCharacters();
      print("Characters: $characters");
      setState(() {
        _characters = characters;
        _selectedId = widget.currentAvatarId;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print('Ошибка загрузки персонажей: $e');
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
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
                itemCount: _characters.length,
                itemBuilder: (context, index) {
                  final character = _characters[index];
                  final isSelected = character.id == _selectedId;

                  return GestureDetector(
                    onTap: () => setState(() => _selectedId = character.id),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: isSelected
                            ? Border.all(color: AppColors.blue, width: 3)
                            : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: RemoteAvatarImage(
                              url: character.imageUrl,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.scaleDown,
                              placeholder: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: const Icon(Icons.error),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(character.name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed:
                  _selectedId != null && _selectedId != widget.currentAvatarId
                  ? () {
                      final selectedCharacter = _characters.firstWhere(
                        (c) => c.id == _selectedId,
                      );
                      Navigator.pop(context, selectedCharacter);
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
