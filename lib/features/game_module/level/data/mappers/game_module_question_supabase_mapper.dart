import 'dart:convert';

import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/features/game_module/level/data/dtos/game_module_question_dto.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';

abstract final class GameModuleQuestionSupabaseMapper {
  static GameModuleQuestionEntity toEntity(GameModuleQuestionDto dto) {
    final type = QuestionType.parseLoose(dto.questionType);
    final answers = _parseAnswers(dto.answers);
    final correctRaw = dto.correctAnswer;

    final correctAnswerIndices = type == QuestionType.multipleSelect
        ? _parseMultipleSelectIndices(correctRaw)
        : null;
    final correctAnswer = _normalizeCorrectAnswer(
      type: type,
      raw: correctRaw,
      answers: answers,
    );

    return GameModuleQuestionEntity(
      id: dto.id,
      question: dto.question ?? '',
      questionType: type,
      answers: answers,
      explanation: dto.explanation ?? '',
      orderIndex: dto.orderIndex ?? 0,
      levelId: dto.levelId,
      correctAnswer: correctAnswer,
      correctAnswerIndices: correctAnswerIndices,
      characterId: dto.characterId?.toInt(),
    );
  }

  static List<int>? _parseMultipleSelectIndices(dynamic raw) {
    if (raw == null) return null;
    if (raw is List) {
      final out = <int>[];
      for (final e in raw) {
        if (e is int) {
          out.add(e);
        } else if (e is num) {
          out.add(e.toInt());
        } else {
          final i = int.tryParse(e.toString());
          if (i != null) out.add(i);
        }
      }
      return out.isEmpty ? null : out;
    }
    if (raw is String) {
      final s = raw.trim();
      if (s.isEmpty) return null;
      if (s.startsWith('[')) {
        try {
          final decoded = jsonDecode(s);
          if (decoded is List) {
            return _parseMultipleSelectIndices(decoded);
          }
        } catch (_) {
          return null;
        }
      }
      final fromCsv = s
          .split(',')
          .map((e) => int.tryParse(e.trim()))
          .whereType<int>()
          .toList();
      return fromCsv.isEmpty ? null : fromCsv;
    }
    final single = int.tryParse(raw.toString());
    return single != null ? [single] : null;
  }

  static List<String> _parseAnswers(List<Object?>? value) {
    if (value == null) return [];
    return value.map((e) {
      if (e is String) return e;
      return e.toString();
    }).toList();
  }

  static String? _normalizeCorrectAnswer({
    required QuestionType type,
    required dynamic raw,
    required List<String> answers,
  }) {
    if (raw == null) return null;

    switch (type) {
      case QuestionType.multipleSelect:
        if (raw is List) {
          return raw.map((e) => (e as num).toInt()).join(',');
        }
        return raw.toString();
      case QuestionType.trueFalse:
        final s = raw.toString().trim();
        if (s == '0' || s == '1') {
          final i = int.tryParse(s);
          if (i != null && i >= 0 && i < answers.length) {
            return answers[i];
          }
        }
        return s;
      case QuestionType.multipleChoice:
        final s = raw.toString().trim();
        final idx = int.tryParse(s);
        if (idx != null && idx >= 0 && idx < answers.length) {
          return answers[idx];
        }
        return s;
      case QuestionType.fillBlank:
        return raw.toString();
    }
  }
}
