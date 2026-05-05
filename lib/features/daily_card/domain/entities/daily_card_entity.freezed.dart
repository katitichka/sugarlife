// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyCardEntity {

 int get id; String get question; bool get isMyth; String get explanation; int get dayNumber;
/// Create a copy of DailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCardEntityCopyWith<DailyCardEntity> get copyWith => _$DailyCardEntityCopyWithImpl<DailyCardEntity>(this as DailyCardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.isMyth, isMyth) || other.isMyth == isMyth)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,isMyth,explanation,dayNumber);

@override
String toString() {
  return 'DailyCardEntity(id: $id, question: $question, isMyth: $isMyth, explanation: $explanation, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class $DailyCardEntityCopyWith<$Res>  {
  factory $DailyCardEntityCopyWith(DailyCardEntity value, $Res Function(DailyCardEntity) _then) = _$DailyCardEntityCopyWithImpl;
@useResult
$Res call({
 int id, String question, bool isMyth, String explanation, int dayNumber
});




}
/// @nodoc
class _$DailyCardEntityCopyWithImpl<$Res>
    implements $DailyCardEntityCopyWith<$Res> {
  _$DailyCardEntityCopyWithImpl(this._self, this._then);

  final DailyCardEntity _self;
  final $Res Function(DailyCardEntity) _then;

/// Create a copy of DailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? isMyth = null,Object? explanation = null,Object? dayNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,isMyth: null == isMyth ? _self.isMyth : isMyth // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyCardEntity].
extension DailyCardEntityPatterns on DailyCardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyCardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyCardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyCardEntity value)  $default,){
final _that = this;
switch (_that) {
case _DailyCardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyCardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DailyCardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question,  bool isMyth,  String explanation,  int dayNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyCardEntity() when $default != null:
return $default(_that.id,_that.question,_that.isMyth,_that.explanation,_that.dayNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question,  bool isMyth,  String explanation,  int dayNumber)  $default,) {final _that = this;
switch (_that) {
case _DailyCardEntity():
return $default(_that.id,_that.question,_that.isMyth,_that.explanation,_that.dayNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question,  bool isMyth,  String explanation,  int dayNumber)?  $default,) {final _that = this;
switch (_that) {
case _DailyCardEntity() when $default != null:
return $default(_that.id,_that.question,_that.isMyth,_that.explanation,_that.dayNumber);case _:
  return null;

}
}

}

/// @nodoc


class _DailyCardEntity implements DailyCardEntity {
  const _DailyCardEntity({required this.id, required this.question, required this.isMyth, required this.explanation, required this.dayNumber});
  

@override final  int id;
@override final  String question;
@override final  bool isMyth;
@override final  String explanation;
@override final  int dayNumber;

/// Create a copy of DailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCardEntityCopyWith<_DailyCardEntity> get copyWith => __$DailyCardEntityCopyWithImpl<_DailyCardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyCardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.isMyth, isMyth) || other.isMyth == isMyth)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,isMyth,explanation,dayNumber);

@override
String toString() {
  return 'DailyCardEntity(id: $id, question: $question, isMyth: $isMyth, explanation: $explanation, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class _$DailyCardEntityCopyWith<$Res> implements $DailyCardEntityCopyWith<$Res> {
  factory _$DailyCardEntityCopyWith(_DailyCardEntity value, $Res Function(_DailyCardEntity) _then) = __$DailyCardEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String question, bool isMyth, String explanation, int dayNumber
});




}
/// @nodoc
class __$DailyCardEntityCopyWithImpl<$Res>
    implements _$DailyCardEntityCopyWith<$Res> {
  __$DailyCardEntityCopyWithImpl(this._self, this._then);

  final _DailyCardEntity _self;
  final $Res Function(_DailyCardEntity) _then;

/// Create a copy of DailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? isMyth = null,Object? explanation = null,Object? dayNumber = null,}) {
  return _then(_DailyCardEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,isMyth: null == isMyth ? _self.isMyth : isMyth // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
