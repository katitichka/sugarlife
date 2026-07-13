// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_daily_card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnsweredDailyCardEntity {

 bool get isCorrect; DailyCardEntity get card;
/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnsweredDailyCardEntityCopyWith<AnsweredDailyCardEntity> get copyWith => _$AnsweredDailyCardEntityCopyWithImpl<AnsweredDailyCardEntity>(this as AnsweredDailyCardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnsweredDailyCardEntity&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,card);

@override
String toString() {
  return 'AnsweredDailyCardEntity(isCorrect: $isCorrect, card: $card)';
}


}

/// @nodoc
abstract mixin class $AnsweredDailyCardEntityCopyWith<$Res>  {
  factory $AnsweredDailyCardEntityCopyWith(AnsweredDailyCardEntity value, $Res Function(AnsweredDailyCardEntity) _then) = _$AnsweredDailyCardEntityCopyWithImpl;
@useResult
$Res call({
 bool isCorrect, DailyCardEntity card
});


$DailyCardEntityCopyWith<$Res> get card;

}
/// @nodoc
class _$AnsweredDailyCardEntityCopyWithImpl<$Res>
    implements $AnsweredDailyCardEntityCopyWith<$Res> {
  _$AnsweredDailyCardEntityCopyWithImpl(this._self, this._then);

  final AnsweredDailyCardEntity _self;
  final $Res Function(AnsweredDailyCardEntity) _then;

/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? card = null,}) {
  return _then(_self.copyWith(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as DailyCardEntity,
  ));
}
/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCardEntityCopyWith<$Res> get card {
  
  return $DailyCardEntityCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnsweredDailyCardEntity].
extension AnsweredDailyCardEntityPatterns on AnsweredDailyCardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnsweredDailyCardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnsweredDailyCardEntity value)  $default,){
final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnsweredDailyCardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isCorrect,  DailyCardEntity card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity() when $default != null:
return $default(_that.isCorrect,_that.card);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isCorrect,  DailyCardEntity card)  $default,) {final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity():
return $default(_that.isCorrect,_that.card);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isCorrect,  DailyCardEntity card)?  $default,) {final _that = this;
switch (_that) {
case _AnsweredDailyCardEntity() when $default != null:
return $default(_that.isCorrect,_that.card);case _:
  return null;

}
}

}

/// @nodoc


class _AnsweredDailyCardEntity implements AnsweredDailyCardEntity {
  const _AnsweredDailyCardEntity({required this.isCorrect, required this.card});
  

@override final  bool isCorrect;
@override final  DailyCardEntity card;

/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnsweredDailyCardEntityCopyWith<_AnsweredDailyCardEntity> get copyWith => __$AnsweredDailyCardEntityCopyWithImpl<_AnsweredDailyCardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnsweredDailyCardEntity&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.card, card) || other.card == card));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,card);

@override
String toString() {
  return 'AnsweredDailyCardEntity(isCorrect: $isCorrect, card: $card)';
}


}

/// @nodoc
abstract mixin class _$AnsweredDailyCardEntityCopyWith<$Res> implements $AnsweredDailyCardEntityCopyWith<$Res> {
  factory _$AnsweredDailyCardEntityCopyWith(_AnsweredDailyCardEntity value, $Res Function(_AnsweredDailyCardEntity) _then) = __$AnsweredDailyCardEntityCopyWithImpl;
@override @useResult
$Res call({
 bool isCorrect, DailyCardEntity card
});


@override $DailyCardEntityCopyWith<$Res> get card;

}
/// @nodoc
class __$AnsweredDailyCardEntityCopyWithImpl<$Res>
    implements _$AnsweredDailyCardEntityCopyWith<$Res> {
  __$AnsweredDailyCardEntityCopyWithImpl(this._self, this._then);

  final _AnsweredDailyCardEntity _self;
  final $Res Function(_AnsweredDailyCardEntity) _then;

/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? card = null,}) {
  return _then(_AnsweredDailyCardEntity(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as DailyCardEntity,
  ));
}

/// Create a copy of AnsweredDailyCardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCardEntityCopyWith<$Res> get card {
  
  return $DailyCardEntityCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

// dart format on
