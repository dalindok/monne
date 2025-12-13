import 'package:bloc/bloc.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeBloc() : super(const IncomeState()) {
    on<IncomeEvent>((event, emit) {});
  }
}
