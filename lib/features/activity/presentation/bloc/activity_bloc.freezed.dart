// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivityEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivityEvent()';
  }
}

/// @nodoc
class $ActivityEventCopyWith<$Res> {
  $ActivityEventCopyWith(ActivityEvent _, $Res Function(ActivityEvent) __);
}

/// @nodoc

class _Init implements ActivityEvent {
  const _Init();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivityEvent.init()';
  }
}

/// @nodoc

class _Add implements ActivityEvent {
  const _Add(this.activity);

  final Activity activity;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCopyWith<_Add> get copyWith =>
      __$AddCopyWithImpl<_Add>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Add &&
            (identical(other.activity, activity) ||
                other.activity == activity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity);

  @override
  String toString() {
    return 'ActivityEvent.add(activity: $activity)';
  }
}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res>
    implements $ActivityEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) =
      __$AddCopyWithImpl;
  @useResult
  $Res call({Activity activity});

  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class __$AddCopyWithImpl<$Res> implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activity = null,
  }) {
    return _then(_Add(
      null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
    ));
  }

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_self.activity, (value) {
      return _then(_self.copyWith(activity: value));
    });
  }
}

/// @nodoc

class _Delete implements ActivityEvent {
  const _Delete(this.activityId);

  final int activityId;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Delete &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activityId);

  @override
  String toString() {
    return 'ActivityEvent.delete(activityId: $activityId)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res>
    implements $ActivityEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) =
      __$DeleteCopyWithImpl;
  @useResult
  $Res call({int activityId});
}

/// @nodoc
class __$DeleteCopyWithImpl<$Res> implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activityId = null,
  }) {
    return _then(_Delete(
      null == activityId
          ? _self.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
