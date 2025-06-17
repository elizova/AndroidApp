import 'package:android_app/domain/entities/activity.dart';
import 'package:android_app/domain/repositories/activity_repository.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_bloc.freezed.dart';
part 'activity_event.dart';

typedef _State = IList<Activity>;
typedef ActivityState = _State;

class ActivityBloc extends Bloc<ActivityEvent, _State> {
  final ActivityRepository _repository;

  ActivityBloc(this._repository) : super(const IListConst([])) {
    on<_Init>(_onInit);
    on<_Add>(_onAddActivity);
  }

  Future<void> _onInit(_Init event, Emitter<_State> emit) async {
    final activities = await _repository.getActivities();
    emit(IList(activities));
  }

  Future<void> _onAddActivity(_Add event, Emitter<_State> emit) async {
    final id = await _repository.createActivity(event.activity);
    final activity = event.activity.copyWith(id: id);
    emit(state.add(activity));
  }
}
