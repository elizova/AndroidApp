import 'package:android_app/domain/entities/activity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_bloc.freezed.dart';
part 'activity_event.dart';

typedef _State = IList<Activity>;
typedef ActivityState = _State;

class ActivityBloc extends Bloc<ActivityEvent, _State> {
  ActivityBloc() : super(const IListConst([])) {
    on<_Add>(_onAddActivity);
    on<_Delete>(_onDeleteActivity);
  }

  void _onAddActivity(_Add event, Emitter<_State> emit) {
    emit(state.add(event.activity));
  }

  void _onDeleteActivity(_Delete event, Emitter<_State> emit) {
    emit(state.removeWhere((activity) => activity.id == event.activityId));
  }
}
