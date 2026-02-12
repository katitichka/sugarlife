import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/features/theory_module/domain/entities/theory_module_entity.dart';
import 'package:sugarlife/features/theory_module/domain/repositories/theory_module_repository.dart';

part 'theory_module_list_state.dart';
part 'theory_module_list_event.dart';
part 'theory_module_list_bloc.freezed.dart';

sealed class TheoryModuleListBloc with _$TheoryModuleListBloc {
  final TheoryModuleRepository _theoryModuleRepository;
  TheoryModuleListBloc({required TheoryModuleRepository theoryModuleRepository})
      : _theoryModuleRepository = theoryModuleRepository,
        super(const _Initial()) {
    on<TheoryModuleListEvent>(
      (event, emit) => switch (event) {
        _Receive() => _onReceiveTheoryModuleList(emit),
        _Select() => _onSelectTheoryModuleList(emit),
      },
    );
  }

  Future<void> _onReceiveTheoryModuleList(
      Emiter<TheoryModuleListState> emit) async {
    emit(const TheoryModuleListState.ReceiveInProgress(
        message: 'Загрузка модулей'));
    try {
      final theoryModuleList = await _theoryModuleRepository.getAllModules();
      emit(TheoryModuleListState.receiveSuccess(
          theoryModules: theoryModuleList));
    } catch (e) {
      emit(TheoryModuleListState.receiveFailed(
          message: 'Ошибка загрузки модулей'));
    }
  }

  Future<void> _onSelectTheoryModuleList(
      Emiter<TheoryModuleListState> emit, int id) async {
    try {
      final SharedPreferences = SharedPreferencesAsync();
      if (state is ReceiveSuccess) {
        final theoryModuleList = (state as ReceiveSuccess).theoryModuleList;
        final theoryModuleSelected = theoryModuleList.map((theoryModule) {
          if (theoryModule.id == id) {
            SharedPreferences.setInt('theoryModuleId', theoryModule.id);
            return theoryModule.copyWith(selected: true);
          }
          return theoryModule.copyWith(selected: false);
        }).toList();
      }
      emit(TheoryModuleListState.selected(theoryModuleId: id));
      emit(TheoryModuleListState.receiveSuccess(
          theoryModules: theoryModuleSelected));
    } catch (e) {
      rethrow;
    }
  }
}
