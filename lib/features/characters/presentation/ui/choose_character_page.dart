import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_svg/flutter_cached_svg.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/characters/domain/entitites/character_entity.dart';
import 'package:sugarlife/features/profile/domain/repositories/profile_repository.dart';

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
        title: Text('Выберите своего аватара', style: TextStyle(color: AppColors.blue, fontFamily: ),),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 420,
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
                            child: FlutterCachedSvg(
                              character.imageUrl,
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
            SizedBox(height: 20),
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

              child: Text('Готово'),
            ),
          ],
        ),
      ),
    );
  }
}
