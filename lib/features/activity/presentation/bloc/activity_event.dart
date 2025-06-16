part of 'activity_bloc.dart';

@freezed
sealed class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent.init() = _Init;
  const factory ActivityEvent.add(Activity activity) = _Add;
  const factory ActivityEvent.delete(int activityId) = _Delete;
}
