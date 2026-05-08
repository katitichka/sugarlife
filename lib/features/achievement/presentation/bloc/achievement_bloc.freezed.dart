// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AchievementEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchievementEvent()';
}


}

/// @nodoc
class $AchievementEventCopyWith<$Res>  {
$AchievementEventCopyWith(AchievementEvent _, $Res Function(AchievementEvent) __);
}


/// Adds pattern-matching-related methods to [AchievementEvent].
extension AchievementEventPatterns on AchievementEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadAchievements value)?  loadAchievements,TResult Function( _CheckPendingAchievement value)?  checkPendingAchievement,TResult Function( _MarkPendingAchievementShown value)?  markPendingAchievementShown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadAchievements() when loadAchievements != null:
return loadAchievements(_that);case _CheckPendingAchievement() when checkPendingAchievement != null:
return checkPendingAchievement(_that);case _MarkPendingAchievementShown() when markPendingAchievementShown != null:
return markPendingAchievementShown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadAchievements value)  loadAchievements,required TResult Function( _CheckPendingAchievement value)  checkPendingAchievement,required TResult Function( _MarkPendingAchievementShown value)  markPendingAchievementShown,}){
final _that = this;
switch (_that) {
case _LoadAchievements():
return loadAchievements(_that);case _CheckPendingAchievement():
return checkPendingAchievement(_that);case _MarkPendingAchievementShown():
return markPendingAchievementShown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadAchievements value)?  loadAchievements,TResult? Function( _CheckPendingAchievement value)?  checkPendingAchievement,TResult? Function( _MarkPendingAchievementShown value)?  markPendingAchievementShown,}){
final _that = this;
switch (_that) {
case _LoadAchievements() when loadAchievements != null:
return loadAchievements(_that);case _CheckPendingAchievement() when checkPendingAchievement != null:
return checkPendingAchievement(_that);case _MarkPendingAchievementShown() when markPendingAchievementShown != null:
return markPendingAchievementShown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAchievements,TResult Function()?  checkPendingAchievement,TResult Function( int achievementId)?  markPendingAchievementShown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadAchievements() when loadAchievements != null:
return loadAchievements();case _CheckPendingAchievement() when checkPendingAchievement != null:
return checkPendingAchievement();case _MarkPendingAchievementShown() when markPendingAchievementShown != null:
return markPendingAchievementShown(_that.achievementId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAchievements,required TResult Function()  checkPendingAchievement,required TResult Function( int achievementId)  markPendingAchievementShown,}) {final _that = this;
switch (_that) {
case _LoadAchievements():
return loadAchievements();case _CheckPendingAchievement():
return checkPendingAchievement();case _MarkPendingAchievementShown():
return markPendingAchievementShown(_that.achievementId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAchievements,TResult? Function()?  checkPendingAchievement,TResult? Function( int achievementId)?  markPendingAchievementShown,}) {final _that = this;
switch (_that) {
case _LoadAchievements() when loadAchievements != null:
return loadAchievements();case _CheckPendingAchievement() when checkPendingAchievement != null:
return checkPendingAchievement();case _MarkPendingAchievementShown() when markPendingAchievementShown != null:
return markPendingAchievementShown(_that.achievementId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadAchievements implements AchievementEvent {
  const _LoadAchievements();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAchievements);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchievementEvent.loadAchievements()';
}


}




/// @nodoc


class _CheckPendingAchievement implements AchievementEvent {
  const _CheckPendingAchievement();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckPendingAchievement);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AchievementEvent.checkPendingAchievement()';
}


}




/// @nodoc


class _MarkPendingAchievementShown implements AchievementEvent {
  const _MarkPendingAchievementShown({required this.achievementId});
  

 final  int achievementId;

/// Create a copy of AchievementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkPendingAchievementShownCopyWith<_MarkPendingAchievementShown> get copyWith => __$MarkPendingAchievementShownCopyWithImpl<_MarkPendingAchievementShown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkPendingAchievementShown&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId));
}


@override
int get hashCode => Object.hash(runtimeType,achievementId);

@override
String toString() {
  return 'AchievementEvent.markPendingAchievementShown(achievementId: $achievementId)';
}


}

/// @nodoc
abstract mixin class _$MarkPendingAchievementShownCopyWith<$Res> implements $AchievementEventCopyWith<$Res> {
  factory _$MarkPendingAchievementShownCopyWith(_MarkPendingAchievementShown value, $Res Function(_MarkPendingAchievementShown) _then) = __$MarkPendingAchievementShownCopyWithImpl;
@useResult
$Res call({
 int achievementId
});




}
/// @nodoc
class __$MarkPendingAchievementShownCopyWithImpl<$Res>
    implements _$MarkPendingAchievementShownCopyWith<$Res> {
  __$MarkPendingAchievementShownCopyWithImpl(this._self, this._then);

  final _MarkPendingAchievementShown _self;
  final $Res Function(_MarkPendingAchievementShown) _then;

/// Create a copy of AchievementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? achievementId = null,}) {
  return _then(_MarkPendingAchievementShown(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AchievementState {

 List<AchievementEntity> get achievements; AchievementEntity? get pendingAchievement;/// Увеличивается при каждой проверке pending из хранилища, чтобы слушатели
/// срабатывали даже если [pendingAchievement] по значению не изменился
/// (Bloc не шлёт уведомление при `state == previousState`).
 int get pendingSyncToken;
/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementStateCopyWith<AchievementState> get copyWith => _$AchievementStateCopyWithImpl<AchievementState>(this as AchievementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementState&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.pendingAchievement, pendingAchievement) || other.pendingAchievement == pendingAchievement)&&(identical(other.pendingSyncToken, pendingSyncToken) || other.pendingSyncToken == pendingSyncToken));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(achievements),pendingAchievement,pendingSyncToken);

@override
String toString() {
  return 'AchievementState(achievements: $achievements, pendingAchievement: $pendingAchievement, pendingSyncToken: $pendingSyncToken)';
}


}

/// @nodoc
abstract mixin class $AchievementStateCopyWith<$Res>  {
  factory $AchievementStateCopyWith(AchievementState value, $Res Function(AchievementState) _then) = _$AchievementStateCopyWithImpl;
@useResult
$Res call({
 List<AchievementEntity> achievements, AchievementEntity? pendingAchievement, int pendingSyncToken
});


$AchievementEntityCopyWith<$Res>? get pendingAchievement;

}
/// @nodoc
class _$AchievementStateCopyWithImpl<$Res>
    implements $AchievementStateCopyWith<$Res> {
  _$AchievementStateCopyWithImpl(this._self, this._then);

  final AchievementState _self;
  final $Res Function(AchievementState) _then;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievements = null,Object? pendingAchievement = freezed,Object? pendingSyncToken = null,}) {
  return _then(_self.copyWith(
achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<AchievementEntity>,pendingAchievement: freezed == pendingAchievement ? _self.pendingAchievement : pendingAchievement // ignore: cast_nullable_to_non_nullable
as AchievementEntity?,pendingSyncToken: null == pendingSyncToken ? _self.pendingSyncToken : pendingSyncToken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementEntityCopyWith<$Res>? get pendingAchievement {
    if (_self.pendingAchievement == null) {
    return null;
  }

  return $AchievementEntityCopyWith<$Res>(_self.pendingAchievement!, (value) {
    return _then(_self.copyWith(pendingAchievement: value));
  });
}
}


/// Adds pattern-matching-related methods to [AchievementState].
extension AchievementStatePatterns on AchievementState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementState value)  $default,){
final _that = this;
switch (_that) {
case _AchievementState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementState value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AchievementEntity> achievements,  AchievementEntity? pendingAchievement,  int pendingSyncToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that.achievements,_that.pendingAchievement,_that.pendingSyncToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AchievementEntity> achievements,  AchievementEntity? pendingAchievement,  int pendingSyncToken)  $default,) {final _that = this;
switch (_that) {
case _AchievementState():
return $default(_that.achievements,_that.pendingAchievement,_that.pendingSyncToken);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AchievementEntity> achievements,  AchievementEntity? pendingAchievement,  int pendingSyncToken)?  $default,) {final _that = this;
switch (_that) {
case _AchievementState() when $default != null:
return $default(_that.achievements,_that.pendingAchievement,_that.pendingSyncToken);case _:
  return null;

}
}

}

/// @nodoc


class _AchievementState implements AchievementState {
  const _AchievementState({final  List<AchievementEntity> achievements = const [], this.pendingAchievement, this.pendingSyncToken = 0}): _achievements = achievements;
  

 final  List<AchievementEntity> _achievements;
@override@JsonKey() List<AchievementEntity> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override final  AchievementEntity? pendingAchievement;
/// Увеличивается при каждой проверке pending из хранилища, чтобы слушатели
/// срабатывали даже если [pendingAchievement] по значению не изменился
/// (Bloc не шлёт уведомление при `state == previousState`).
@override@JsonKey() final  int pendingSyncToken;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementStateCopyWith<_AchievementState> get copyWith => __$AchievementStateCopyWithImpl<_AchievementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementState&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.pendingAchievement, pendingAchievement) || other.pendingAchievement == pendingAchievement)&&(identical(other.pendingSyncToken, pendingSyncToken) || other.pendingSyncToken == pendingSyncToken));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_achievements),pendingAchievement,pendingSyncToken);

@override
String toString() {
  return 'AchievementState(achievements: $achievements, pendingAchievement: $pendingAchievement, pendingSyncToken: $pendingSyncToken)';
}


}

/// @nodoc
abstract mixin class _$AchievementStateCopyWith<$Res> implements $AchievementStateCopyWith<$Res> {
  factory _$AchievementStateCopyWith(_AchievementState value, $Res Function(_AchievementState) _then) = __$AchievementStateCopyWithImpl;
@override @useResult
$Res call({
 List<AchievementEntity> achievements, AchievementEntity? pendingAchievement, int pendingSyncToken
});


@override $AchievementEntityCopyWith<$Res>? get pendingAchievement;

}
/// @nodoc
class __$AchievementStateCopyWithImpl<$Res>
    implements _$AchievementStateCopyWith<$Res> {
  __$AchievementStateCopyWithImpl(this._self, this._then);

  final _AchievementState _self;
  final $Res Function(_AchievementState) _then;

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievements = null,Object? pendingAchievement = freezed,Object? pendingSyncToken = null,}) {
  return _then(_AchievementState(
achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<AchievementEntity>,pendingAchievement: freezed == pendingAchievement ? _self.pendingAchievement : pendingAchievement // ignore: cast_nullable_to_non_nullable
as AchievementEntity?,pendingSyncToken: null == pendingSyncToken ? _self.pendingSyncToken : pendingSyncToken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of AchievementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementEntityCopyWith<$Res>? get pendingAchievement {
    if (_self.pendingAchievement == null) {
    return null;
  }

  return $AchievementEntityCopyWith<$Res>(_self.pendingAchievement!, (value) {
    return _then(_self.copyWith(pendingAchievement: value));
  });
}
}

// dart format on
