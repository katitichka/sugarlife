// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_progress_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LevelProgressEntity {

 int get levelId; bool get isCompleted; int? get stars; DateTime? get lastPlayedAt;
/// Create a copy of LevelProgressEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelProgressEntityCopyWith<LevelProgressEntity> get copyWith => _$LevelProgressEntityCopyWithImpl<LevelProgressEntity>(this as LevelProgressEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelProgressEntity&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}


@override
int get hashCode => Object.hash(runtimeType,levelId,isCompleted,stars,lastPlayedAt);

@override
String toString() {
  return 'LevelProgressEntity(levelId: $levelId, isCompleted: $isCompleted, stars: $stars, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class $LevelProgressEntityCopyWith<$Res>  {
  factory $LevelProgressEntityCopyWith(LevelProgressEntity value, $Res Function(LevelProgressEntity) _then) = _$LevelProgressEntityCopyWithImpl;
@useResult
$Res call({
 int levelId, bool isCompleted, int? stars, DateTime? lastPlayedAt
});




}
/// @nodoc
class _$LevelProgressEntityCopyWithImpl<$Res>
    implements $LevelProgressEntityCopyWith<$Res> {
  _$LevelProgressEntityCopyWithImpl(this._self, this._then);

  final LevelProgressEntity _self;
  final $Res Function(LevelProgressEntity) _then;

/// Create a copy of LevelProgressEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levelId = null,Object? isCompleted = null,Object? stars = freezed,Object? lastPlayedAt = freezed,}) {
  return _then(_self.copyWith(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LevelProgressEntity].
extension LevelProgressEntityPatterns on LevelProgressEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LevelProgressEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LevelProgressEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LevelProgressEntity value)  $default,){
final _that = this;
switch (_that) {
case _LevelProgressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LevelProgressEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LevelProgressEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int levelId,  bool isCompleted,  int? stars,  DateTime? lastPlayedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LevelProgressEntity() when $default != null:
return $default(_that.levelId,_that.isCompleted,_that.stars,_that.lastPlayedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int levelId,  bool isCompleted,  int? stars,  DateTime? lastPlayedAt)  $default,) {final _that = this;
switch (_that) {
case _LevelProgressEntity():
return $default(_that.levelId,_that.isCompleted,_that.stars,_that.lastPlayedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int levelId,  bool isCompleted,  int? stars,  DateTime? lastPlayedAt)?  $default,) {final _that = this;
switch (_that) {
case _LevelProgressEntity() when $default != null:
return $default(_that.levelId,_that.isCompleted,_that.stars,_that.lastPlayedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LevelProgressEntity implements LevelProgressEntity {
  const _LevelProgressEntity({required this.levelId, required this.isCompleted, required this.stars, required this.lastPlayedAt});
  

@override final  int levelId;
@override final  bool isCompleted;
@override final  int? stars;
@override final  DateTime? lastPlayedAt;

/// Create a copy of LevelProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelProgressEntityCopyWith<_LevelProgressEntity> get copyWith => __$LevelProgressEntityCopyWithImpl<_LevelProgressEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LevelProgressEntity&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}


@override
int get hashCode => Object.hash(runtimeType,levelId,isCompleted,stars,lastPlayedAt);

@override
String toString() {
  return 'LevelProgressEntity(levelId: $levelId, isCompleted: $isCompleted, stars: $stars, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class _$LevelProgressEntityCopyWith<$Res> implements $LevelProgressEntityCopyWith<$Res> {
  factory _$LevelProgressEntityCopyWith(_LevelProgressEntity value, $Res Function(_LevelProgressEntity) _then) = __$LevelProgressEntityCopyWithImpl;
@override @useResult
$Res call({
 int levelId, bool isCompleted, int? stars, DateTime? lastPlayedAt
});




}
/// @nodoc
class __$LevelProgressEntityCopyWithImpl<$Res>
    implements _$LevelProgressEntityCopyWith<$Res> {
  __$LevelProgressEntityCopyWithImpl(this._self, this._then);

  final _LevelProgressEntity _self;
  final $Res Function(_LevelProgressEntity) _then;

/// Create a copy of LevelProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levelId = null,Object? isCompleted = null,Object? stars = freezed,Object? lastPlayedAt = freezed,}) {
  return _then(_LevelProgressEntity(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
