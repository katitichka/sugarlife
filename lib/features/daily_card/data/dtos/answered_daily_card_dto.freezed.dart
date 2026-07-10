// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answered_daily_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnsweredDailyCardDto {

@JsonKey(name: 'is_correct') bool get isCorrect;@JsonKey(name: 'daily_cards') DailyCardDto get card;
/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnsweredDailyCardDtoCopyWith<AnsweredDailyCardDto> get copyWith => _$AnsweredDailyCardDtoCopyWithImpl<AnsweredDailyCardDto>(this as AnsweredDailyCardDto, _$identity);

  /// Serializes this AnsweredDailyCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnsweredDailyCardDto&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCorrect,card);

@override
String toString() {
  return 'AnsweredDailyCardDto(isCorrect: $isCorrect, card: $card)';
}


}

/// @nodoc
abstract mixin class $AnsweredDailyCardDtoCopyWith<$Res>  {
  factory $AnsweredDailyCardDtoCopyWith(AnsweredDailyCardDto value, $Res Function(AnsweredDailyCardDto) _then) = _$AnsweredDailyCardDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'daily_cards') DailyCardDto card
});


$DailyCardDtoCopyWith<$Res> get card;

}
/// @nodoc
class _$AnsweredDailyCardDtoCopyWithImpl<$Res>
    implements $AnsweredDailyCardDtoCopyWith<$Res> {
  _$AnsweredDailyCardDtoCopyWithImpl(this._self, this._then);

  final AnsweredDailyCardDto _self;
  final $Res Function(AnsweredDailyCardDto) _then;

/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? card = null,}) {
  return _then(_self.copyWith(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as DailyCardDto,
  ));
}
/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCardDtoCopyWith<$Res> get card {
  
  return $DailyCardDtoCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnsweredDailyCardDto].
extension AnsweredDailyCardDtoPatterns on AnsweredDailyCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnsweredDailyCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnsweredDailyCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnsweredDailyCardDto value)  $default,){
final _that = this;
switch (_that) {
case _AnsweredDailyCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnsweredDailyCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnsweredDailyCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'daily_cards')  DailyCardDto card)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnsweredDailyCardDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'daily_cards')  DailyCardDto card)  $default,) {final _that = this;
switch (_that) {
case _AnsweredDailyCardDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'daily_cards')  DailyCardDto card)?  $default,) {final _that = this;
switch (_that) {
case _AnsweredDailyCardDto() when $default != null:
return $default(_that.isCorrect,_that.card);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnsweredDailyCardDto implements AnsweredDailyCardDto {
  const _AnsweredDailyCardDto({@JsonKey(name: 'is_correct') required this.isCorrect, @JsonKey(name: 'daily_cards') required this.card});
  factory _AnsweredDailyCardDto.fromJson(Map<String, dynamic> json) => _$AnsweredDailyCardDtoFromJson(json);

@override@JsonKey(name: 'is_correct') final  bool isCorrect;
@override@JsonKey(name: 'daily_cards') final  DailyCardDto card;

/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnsweredDailyCardDtoCopyWith<_AnsweredDailyCardDto> get copyWith => __$AnsweredDailyCardDtoCopyWithImpl<_AnsweredDailyCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnsweredDailyCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnsweredDailyCardDto&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.card, card) || other.card == card));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isCorrect,card);

@override
String toString() {
  return 'AnsweredDailyCardDto(isCorrect: $isCorrect, card: $card)';
}


}

/// @nodoc
abstract mixin class _$AnsweredDailyCardDtoCopyWith<$Res> implements $AnsweredDailyCardDtoCopyWith<$Res> {
  factory _$AnsweredDailyCardDtoCopyWith(_AnsweredDailyCardDto value, $Res Function(_AnsweredDailyCardDto) _then) = __$AnsweredDailyCardDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'daily_cards') DailyCardDto card
});


@override $DailyCardDtoCopyWith<$Res> get card;

}
/// @nodoc
class __$AnsweredDailyCardDtoCopyWithImpl<$Res>
    implements _$AnsweredDailyCardDtoCopyWith<$Res> {
  __$AnsweredDailyCardDtoCopyWithImpl(this._self, this._then);

  final _AnsweredDailyCardDto _self;
  final $Res Function(_AnsweredDailyCardDto) _then;

/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? card = null,}) {
  return _then(_AnsweredDailyCardDto(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as DailyCardDto,
  ));
}

/// Create a copy of AnsweredDailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCardDtoCopyWith<$Res> get card {
  
  return $DailyCardDtoCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

// dart format on
