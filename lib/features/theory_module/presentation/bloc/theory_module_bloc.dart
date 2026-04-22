import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

part 'theory_module_state.dart';
part 'theory_module_event.dart';
part 'theory_module_bloc.freezed.dart';

class TheoryModuleBloc
    extends Bloc<TheoryModuleEvent, TheoryModuleState> {
  final TheoryModuleRepository _theoryModuleRepository;
  TheoryModuleBloc({required TheoryModuleRepository theoryModuleRepository})
    : _theoryModuleRepository = theoryModuleRepository,
      super(const _Initial()) {
    on<_Receive>((event, emit) => _onReceiveTheoryModuleList(emit));
  }

  Future<void> _onReceiveTheoryModuleList(
    Emitter<TheoryModuleState> emit,
  ) async {
    emit(
      const TheoryModuleState.receiveInProgress(
        message: 'Загрузка модулей',
      ),
    );
    try {
      final theoryModuleList = await _theoryModuleRepository.getAllModules();
      emit(
        TheoryModuleState.receiveSuccess(theoryModules: theoryModuleList),
      );
    } catch (e) {
      emit(
        TheoryModuleState.receiveFailed(message: 'Ошибка загрузки модулей'),
      );
    }
  }
}
