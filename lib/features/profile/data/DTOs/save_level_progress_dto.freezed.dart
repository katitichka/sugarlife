// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_level_progress_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveLevelProgressDto {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'level_id') int get levelId; int get stars;@JsonKey(name: 'correct_answers') int get correctAnswers;@JsonKey(name: 'completed_at') String get completedAt;
/// Create a copy of SaveLevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveLevelProgressDtoCopyWith<SaveLevelProgressDto> get copyWith => _$SaveLevelProgressDtoCopyWithImpl<SaveLevelProgressDto>(this as SaveLevelProgressDto, _$identity);

  /// Serializes this SaveLevelProgressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveLevelProgressDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,levelId,stars,correctAnswers,completedAt);

@override
String toString() {
  return 'SaveLevelProgressDto(userId: $userId, levelId: $levelId, stars: $stars, correctAnswers: $correctAnswers, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $SaveLevelProgressDtoCopyWith<$Res>  {
  factory $SaveLevelProgressDtoCopyWith(SaveLevelProgressDto value, $Res Function(SaveLevelProgressDto) _then) = _$SaveLevelProgressDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'level_id') int levelId, int stars,@JsonKey(name: 'correct_answers') int correctAnswers,@JsonKey(name: 'completed_at') String completedAt
});




}
/// @nodoc
class _$SaveLevelProgressDtoCopyWithImpl<$Res>
    implements $SaveLevelProgressDtoCopyWith<$Res> {
  _$SaveLevelProgressDtoCopyWithImpl(this._self, this._then);

  final SaveLevelProgressDto _self;
  final $Res Function(SaveLevelProgressDto) _then;

/// Create a copy of SaveLevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? levelId = null,Object? stars = null,Object? correctAnswers = null,Object? completedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveLevelProgressDto].
extension SaveLevelProgressDtoPatterns on SaveLevelProgressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveLevelProgressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveLevelProgressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveLevelProgressDto value)  $default,){
final _that = this;
switch (_that) {
case _SaveLevelProgressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveLevelProgressDto value)?  $default,){
final _that = this;
switch (_that) {
case _SaveLevelProgressDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'level_id')  int levelId,  int stars, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'completed_at')  String completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveLevelProgressDto() when $default != null:
return $default(_that.userId,_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'level_id')  int levelId,  int stars, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'completed_at')  String completedAt)  $default,) {final _that = this;
switch (_that) {
case _SaveLevelProgressDto():
return $default(_that.userId,_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'level_id')  int levelId,  int stars, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'completed_at')  String completedAt)?  $default,) {final _that = this;
switch (_that) {
case _SaveLevelProgressDto() when $default != null:
return $default(_that.userId,_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaveLevelProgressDto implements SaveLevelProgressDto {
  const _SaveLevelProgressDto({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'level_id') required this.levelId, required this.stars, @JsonKey(name: 'correct_answers') required this.correctAnswers, @JsonKey(name: 'completed_at') required this.completedAt});
  factory _SaveLevelProgressDto.fromJson(Map<String, dynamic> json) => _$SaveLevelProgressDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'level_id') final  int levelId;
@override final  int stars;
@override@JsonKey(name: 'correct_answers') final  int correctAnswers;
@override@JsonKey(name: 'completed_at') final  String completedAt;

/// Create a copy of SaveLevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveLevelProgressDtoCopyWith<_SaveLevelProgressDto> get copyWith => __$SaveLevelProgressDtoCopyWithImpl<_SaveLevelProgressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaveLevelProgressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveLevelProgressDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,levelId,stars,correctAnswers,completedAt);

@override
String toString() {
  return 'SaveLevelProgressDto(userId: $userId, levelId: $levelId, stars: $stars, correctAnswers: $correctAnswers, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$SaveLevelProgressDtoCopyWith<$Res> implements $SaveLevelProgressDtoCopyWith<$Res> {
  factory _$SaveLevelProgressDtoCopyWith(_SaveLevelProgressDto value, $Res Function(_SaveLevelProgressDto) _then) = __$SaveLevelProgressDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'level_id') int levelId, int stars,@JsonKey(name: 'correct_answers') int correctAnswers,@JsonKey(name: 'completed_at') String completedAt
});




}
/// @nodoc
class __$SaveLevelProgressDtoCopyWithImpl<$Res>
    implements _$SaveLevelProgressDtoCopyWith<$Res> {
  __$SaveLevelProgressDtoCopyWithImpl(this._self, this._then);

  final _SaveLevelProgressDto _self;
  final $Res Function(_SaveLevelProgressDto) _then;

/// Create a copy of SaveLevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? levelId = null,Object? stars = null,Object? correctAnswers = null,Object? completedAt = null,}) {
  return _then(_SaveLevelProgressDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
