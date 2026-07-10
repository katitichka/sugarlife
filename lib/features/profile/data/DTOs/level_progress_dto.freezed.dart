// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_progress_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LevelProgressDto {

@JsonKey(name: 'level_id') int get levelId; int? get stars;@JsonKey(name: 'correct_answers') int? get correctAnswers;@JsonKey(name: 'completed_at') String? get completedAt;
/// Create a copy of LevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelProgressDtoCopyWith<LevelProgressDto> get copyWith => _$LevelProgressDtoCopyWithImpl<LevelProgressDto>(this as LevelProgressDto, _$identity);

  /// Serializes this LevelProgressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelProgressDto&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,levelId,stars,correctAnswers,completedAt);

@override
String toString() {
  return 'LevelProgressDto(levelId: $levelId, stars: $stars, correctAnswers: $correctAnswers, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $LevelProgressDtoCopyWith<$Res>  {
  factory $LevelProgressDtoCopyWith(LevelProgressDto value, $Res Function(LevelProgressDto) _then) = _$LevelProgressDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'level_id') int levelId, int? stars,@JsonKey(name: 'correct_answers') int? correctAnswers,@JsonKey(name: 'completed_at') String? completedAt
});




}
/// @nodoc
class _$LevelProgressDtoCopyWithImpl<$Res>
    implements $LevelProgressDtoCopyWith<$Res> {
  _$LevelProgressDtoCopyWithImpl(this._self, this._then);

  final LevelProgressDto _self;
  final $Res Function(LevelProgressDto) _then;

/// Create a copy of LevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? levelId = null,Object? stars = freezed,Object? correctAnswers = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LevelProgressDto].
extension LevelProgressDtoPatterns on LevelProgressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LevelProgressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LevelProgressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LevelProgressDto value)  $default,){
final _that = this;
switch (_that) {
case _LevelProgressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LevelProgressDto value)?  $default,){
final _that = this;
switch (_that) {
case _LevelProgressDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'level_id')  int levelId,  int? stars, @JsonKey(name: 'correct_answers')  int? correctAnswers, @JsonKey(name: 'completed_at')  String? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LevelProgressDto() when $default != null:
return $default(_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'level_id')  int levelId,  int? stars, @JsonKey(name: 'correct_answers')  int? correctAnswers, @JsonKey(name: 'completed_at')  String? completedAt)  $default,) {final _that = this;
switch (_that) {
case _LevelProgressDto():
return $default(_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'level_id')  int levelId,  int? stars, @JsonKey(name: 'correct_answers')  int? correctAnswers, @JsonKey(name: 'completed_at')  String? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _LevelProgressDto() when $default != null:
return $default(_that.levelId,_that.stars,_that.correctAnswers,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LevelProgressDto implements LevelProgressDto {
  const _LevelProgressDto({@JsonKey(name: 'level_id') required this.levelId, this.stars, @JsonKey(name: 'correct_answers') this.correctAnswers, @JsonKey(name: 'completed_at') this.completedAt});
  factory _LevelProgressDto.fromJson(Map<String, dynamic> json) => _$LevelProgressDtoFromJson(json);

@override@JsonKey(name: 'level_id') final  int levelId;
@override final  int? stars;
@override@JsonKey(name: 'correct_answers') final  int? correctAnswers;
@override@JsonKey(name: 'completed_at') final  String? completedAt;

/// Create a copy of LevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelProgressDtoCopyWith<_LevelProgressDto> get copyWith => __$LevelProgressDtoCopyWithImpl<_LevelProgressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LevelProgressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LevelProgressDto&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,levelId,stars,correctAnswers,completedAt);

@override
String toString() {
  return 'LevelProgressDto(levelId: $levelId, stars: $stars, correctAnswers: $correctAnswers, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$LevelProgressDtoCopyWith<$Res> implements $LevelProgressDtoCopyWith<$Res> {
  factory _$LevelProgressDtoCopyWith(_LevelProgressDto value, $Res Function(_LevelProgressDto) _then) = __$LevelProgressDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'level_id') int levelId, int? stars,@JsonKey(name: 'correct_answers') int? correctAnswers,@JsonKey(name: 'completed_at') String? completedAt
});




}
/// @nodoc
class __$LevelProgressDtoCopyWithImpl<$Res>
    implements _$LevelProgressDtoCopyWith<$Res> {
  __$LevelProgressDtoCopyWithImpl(this._self, this._then);

  final _LevelProgressDto _self;
  final $Res Function(_LevelProgressDto) _then;

/// Create a copy of LevelProgressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? levelId = null,Object? stars = freezed,Object? correctAnswers = freezed,Object? completedAt = freezed,}) {
  return _then(_LevelProgressDto(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
