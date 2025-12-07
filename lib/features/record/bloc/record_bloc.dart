import 'package:bloc/bloc.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc() : super(const RecordState()) {
    on<RecordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
