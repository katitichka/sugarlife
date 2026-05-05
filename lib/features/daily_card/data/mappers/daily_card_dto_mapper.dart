

import 'package:sugarlife/features/daily_card/data/dtos/daily_card_dto.dart';
import 'package:sugarlife/features/daily_card/domain/entities/daily_card_entity.dart';

abstract class DailyCardDtoMapper {
  static DailyCardEntity toEntity({required DailyCardDto dto}) {
    return DailyCardEntity(
      id: dto.id, 
      question: dto.question, 
      isMyth: dto.isMyth,
      explanation: dto.explanation,
      dayNumber: dto.dayNumber,
      );
  }
}
