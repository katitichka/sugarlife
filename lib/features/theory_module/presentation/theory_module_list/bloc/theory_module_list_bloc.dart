import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_list_entity.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

part 'theory_module_list_state.dart';
part 'theory_module_list_event.dart';
part 'theory_module_list_bloc.freezed.dart';

sealed class TheoryModuleListBloc
    extends Bloc<TheoryModuleListEvent, TheoryModuleListState> {
  final TheoryModuleRepository _theoryModuleRepository;
  TheoryModuleListBloc({required TheoryModuleRepository theoryModuleRepository})
    : _theoryModuleRepository = theoryModuleRepository,
      super(const _Initial()) {
    on<_Receive>((event, emit) => _onReceiveTheoryModuleList(emit));
  }

  Future<void> _onReceiveTheoryModuleList(
    Emitter<TheoryModuleListState> emit,
  ) async {
    emit(
      const TheoryModuleListState.receiveInProgress(
        message: 'Загрузка модулей',
      ),
    );
    try {
      final theoryModuleList = await _theoryModuleRepository.getAllModules();
      emit(
        TheoryModuleListState.receiveSuccess(theoryModules: theoryModuleList),
      );
    } catch (e) {
      emit(
        TheoryModuleListState.receiveFailed(message: 'Ошибка загрузки модулей'),
      );
    }
  }
}
