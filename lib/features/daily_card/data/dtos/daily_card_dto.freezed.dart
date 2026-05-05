// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyCardDto {

 int get id; String get question;@JsonKey(name: 'is_myth') bool get isMyth; String get explanation;@JsonKey(name: 'day_number') int get dayNumber;
/// Create a copy of DailyCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCardDtoCopyWith<DailyCardDto> get copyWith => _$DailyCardDtoCopyWithImpl<DailyCardDto>(this as DailyCardDto, _$identity);

  /// Serializes this DailyCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.isMyth, isMyth) || other.isMyth == isMyth)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,isMyth,explanation,dayNumber);

@override
String toString() {
  return 'DailyCardDto(id: $id, question: $question, isMyth: $isMyth, explanation: $explanation, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class $DailyCardDtoCopyWith<$Res>  {
  factory $DailyCardDtoCopyWith(DailyCardDto value, $Res Function(DailyCardDto) _then) = _$DailyCardDtoCopyWithImpl;
@useResult
$Res call({
 int id, String question,@JsonKey(name: 'is_myth') bool isMyth, String explanation,@JsonKey(name: 'day_number') int dayNumber
});




}
/// @nodoc
class _$DailyCardDtoCopyWithImpl<$Res>
    implements $DailyCardDtoCopyWith<$Res> {
  _$DailyCardDtoCopyWithImpl(this._self, this._then);

  final DailyCardDto _self;
  final $Res Function(DailyCardDto) _then;

/// Create a copy of DailyCardDto
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


/// Adds pattern-matching-related methods to [DailyCardDto].
extension DailyCardDtoPatterns on DailyCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyCardDto value)  $default,){
final _that = this;
switch (_that) {
case _DailyCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _DailyCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question, @JsonKey(name: 'is_myth')  bool isMyth,  String explanation, @JsonKey(name: 'day_number')  int dayNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyCardDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question, @JsonKey(name: 'is_myth')  bool isMyth,  String explanation, @JsonKey(name: 'day_number')  int dayNumber)  $default,) {final _that = this;
switch (_that) {
case _DailyCardDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question, @JsonKey(name: 'is_myth')  bool isMyth,  String explanation, @JsonKey(name: 'day_number')  int dayNumber)?  $default,) {final _that = this;
switch (_that) {
case _DailyCardDto() when $default != null:
return $default(_that.id,_that.question,_that.isMyth,_that.explanation,_that.dayNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyCardDto implements DailyCardDto {
  const _DailyCardDto({required this.id, required this.question, @JsonKey(name: 'is_myth') required this.isMyth, required this.explanation, @JsonKey(name: 'day_number') required this.dayNumber});
  factory _DailyCardDto.fromJson(Map<String, dynamic> json) => _$DailyCardDtoFromJson(json);

@override final  int id;
@override final  String question;
@override@JsonKey(name: 'is_myth') final  bool isMyth;
@override final  String explanation;
@override@JsonKey(name: 'day_number') final  int dayNumber;

/// Create a copy of DailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCardDtoCopyWith<_DailyCardDto> get copyWith => __$DailyCardDtoCopyWithImpl<_DailyCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.isMyth, isMyth) || other.isMyth == isMyth)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,isMyth,explanation,dayNumber);

@override
String toString() {
  return 'DailyCardDto(id: $id, question: $question, isMyth: $isMyth, explanation: $explanation, dayNumber: $dayNumber)';
}


}

/// @nodoc
abstract mixin class _$DailyCardDtoCopyWith<$Res> implements $DailyCardDtoCopyWith<$Res> {
  factory _$DailyCardDtoCopyWith(_DailyCardDto value, $Res Function(_DailyCardDto) _then) = __$DailyCardDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String question,@JsonKey(name: 'is_myth') bool isMyth, String explanation,@JsonKey(name: 'day_number') int dayNumber
});




}
/// @nodoc
class __$DailyCardDtoCopyWithImpl<$Res>
    implements _$DailyCardDtoCopyWith<$Res> {
  __$DailyCardDtoCopyWithImpl(this._self, this._then);

  final _DailyCardDto _self;
  final $Res Function(_DailyCardDto) _then;

/// Create a copy of DailyCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? isMyth = null,Object? explanation = null,Object? dayNumber = null,}) {
  return _then(_DailyCardDto(
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
