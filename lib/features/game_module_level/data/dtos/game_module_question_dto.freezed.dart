// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_question_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameModuleQuestionDto {

 int get id; String get question;@JsonKey(name: 'question_type') String get questionsType; List<String> get answers; String get explanation;@JsonKey(name: 'order_index') int get orderIndex;@JsonKey(name: 'level_id') int get levelId;@JsonKey(name: 'age_category') String get ageCategory;@JsonKey(name: 'correct_answer') String get correctAnswer;
/// Create a copy of GameModuleQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModuleQuestionDtoCopyWith<GameModuleQuestionDto> get copyWith => _$GameModuleQuestionDtoCopyWithImpl<GameModuleQuestionDto>(this as GameModuleQuestionDto, _$identity);

  /// Serializes this GameModuleQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.questionsType, questionsType) || other.questionsType == questionsType)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.ageCategory, ageCategory) || other.ageCategory == ageCategory)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,questionsType,const DeepCollectionEquality().hash(answers),explanation,orderIndex,levelId,ageCategory,correctAnswer);

@override
String toString() {
  return 'GameModuleQuestionDto(id: $id, question: $question, questionsType: $questionsType, answers: $answers, explanation: $explanation, orderIndex: $orderIndex, levelId: $levelId, ageCategory: $ageCategory, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class $GameModuleQuestionDtoCopyWith<$Res>  {
  factory $GameModuleQuestionDtoCopyWith(GameModuleQuestionDto value, $Res Function(GameModuleQuestionDto) _then) = _$GameModuleQuestionDtoCopyWithImpl;
@useResult
$Res call({
 int id, String question,@JsonKey(name: 'question_type') String questionsType, List<String> answers, String explanation,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'level_id') int levelId,@JsonKey(name: 'age_category') String ageCategory,@JsonKey(name: 'correct_answer') String correctAnswer
});




}
/// @nodoc
class _$GameModuleQuestionDtoCopyWithImpl<$Res>
    implements $GameModuleQuestionDtoCopyWith<$Res> {
  _$GameModuleQuestionDtoCopyWithImpl(this._self, this._then);

  final GameModuleQuestionDto _self;
  final $Res Function(GameModuleQuestionDto) _then;

/// Create a copy of GameModuleQuestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? questionsType = null,Object? answers = null,Object? explanation = null,Object? orderIndex = null,Object? levelId = null,Object? ageCategory = null,Object? correctAnswer = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,questionsType: null == questionsType ? _self.questionsType : questionsType // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,ageCategory: null == ageCategory ? _self.ageCategory : ageCategory // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModuleQuestionDto].
extension GameModuleQuestionDtoPatterns on GameModuleQuestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModuleQuestionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModuleQuestionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModuleQuestionDto value)  $default,){
final _that = this;
switch (_that) {
case _GameModuleQuestionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModuleQuestionDto value)?  $default,){
final _that = this;
switch (_that) {
case _GameModuleQuestionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question, @JsonKey(name: 'question_type')  String questionsType,  List<String> answers,  String explanation, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'level_id')  int levelId, @JsonKey(name: 'age_category')  String ageCategory, @JsonKey(name: 'correct_answer')  String correctAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModuleQuestionDto() when $default != null:
return $default(_that.id,_that.question,_that.questionsType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.ageCategory,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question, @JsonKey(name: 'question_type')  String questionsType,  List<String> answers,  String explanation, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'level_id')  int levelId, @JsonKey(name: 'age_category')  String ageCategory, @JsonKey(name: 'correct_answer')  String correctAnswer)  $default,) {final _that = this;
switch (_that) {
case _GameModuleQuestionDto():
return $default(_that.id,_that.question,_that.questionsType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.ageCategory,_that.correctAnswer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question, @JsonKey(name: 'question_type')  String questionsType,  List<String> answers,  String explanation, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'level_id')  int levelId, @JsonKey(name: 'age_category')  String ageCategory, @JsonKey(name: 'correct_answer')  String correctAnswer)?  $default,) {final _that = this;
switch (_that) {
case _GameModuleQuestionDto() when $default != null:
return $default(_that.id,_that.question,_that.questionsType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.ageCategory,_that.correctAnswer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameModuleQuestionDto implements GameModuleQuestionDto {
  const _GameModuleQuestionDto({required this.id, required this.question, @JsonKey(name: 'question_type') required this.questionsType, required final  List<String> answers, required this.explanation, @JsonKey(name: 'order_index') required this.orderIndex, @JsonKey(name: 'level_id') required this.levelId, @JsonKey(name: 'age_category') required this.ageCategory, @JsonKey(name: 'correct_answer') required this.correctAnswer}): _answers = answers;
  factory _GameModuleQuestionDto.fromJson(Map<String, dynamic> json) => _$GameModuleQuestionDtoFromJson(json);

@override final  int id;
@override final  String question;
@override@JsonKey(name: 'question_type') final  String questionsType;
 final  List<String> _answers;
@override List<String> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  String explanation;
@override@JsonKey(name: 'order_index') final  int orderIndex;
@override@JsonKey(name: 'level_id') final  int levelId;
@override@JsonKey(name: 'age_category') final  String ageCategory;
@override@JsonKey(name: 'correct_answer') final  String correctAnswer;

/// Create a copy of GameModuleQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModuleQuestionDtoCopyWith<_GameModuleQuestionDto> get copyWith => __$GameModuleQuestionDtoCopyWithImpl<_GameModuleQuestionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameModuleQuestionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModuleQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.questionsType, questionsType) || other.questionsType == questionsType)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.ageCategory, ageCategory) || other.ageCategory == ageCategory)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,questionsType,const DeepCollectionEquality().hash(_answers),explanation,orderIndex,levelId,ageCategory,correctAnswer);

@override
String toString() {
  return 'GameModuleQuestionDto(id: $id, question: $question, questionsType: $questionsType, answers: $answers, explanation: $explanation, orderIndex: $orderIndex, levelId: $levelId, ageCategory: $ageCategory, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class _$GameModuleQuestionDtoCopyWith<$Res> implements $GameModuleQuestionDtoCopyWith<$Res> {
  factory _$GameModuleQuestionDtoCopyWith(_GameModuleQuestionDto value, $Res Function(_GameModuleQuestionDto) _then) = __$GameModuleQuestionDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String question,@JsonKey(name: 'question_type') String questionsType, List<String> answers, String explanation,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'level_id') int levelId,@JsonKey(name: 'age_category') String ageCategory,@JsonKey(name: 'correct_answer') String correctAnswer
});




}
/// @nodoc
class __$GameModuleQuestionDtoCopyWithImpl<$Res>
    implements _$GameModuleQuestionDtoCopyWith<$Res> {
  __$GameModuleQuestionDtoCopyWithImpl(this._self, this._then);

  final _GameModuleQuestionDto _self;
  final $Res Function(_GameModuleQuestionDto) _then;

/// Create a copy of GameModuleQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? questionsType = null,Object? answers = null,Object? explanation = null,Object? orderIndex = null,Object? levelId = null,Object? ageCategory = null,Object? correctAnswer = null,}) {
  return _then(_GameModuleQuestionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,questionsType: null == questionsType ? _self.questionsType : questionsType // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,ageCategory: null == ageCategory ? _self.ageCategory : ageCategory // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
