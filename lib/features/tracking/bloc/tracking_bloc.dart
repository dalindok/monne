import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc() : super(const TrackingState()) {
    on<TrackingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
