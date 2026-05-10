// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameModuleQuestionEntity {

 int get id; String get question; QuestionType get questionType; List<String> get answers; String get explanation; int get orderIndex; int get levelId; String? get correctAnswer;// для multiple_choice, true_false, fill_blank
 List<int>? get correctAnswerIndices;// для multiple_select
 int? get characterId;
/// Create a copy of GameModuleQuestionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModuleQuestionEntityCopyWith<GameModuleQuestionEntity> get copyWith => _$GameModuleQuestionEntityCopyWithImpl<GameModuleQuestionEntity>(this as GameModuleQuestionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleQuestionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&const DeepCollectionEquality().equals(other.correctAnswerIndices, correctAnswerIndices)&&(identical(other.characterId, characterId) || other.characterId == characterId));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,questionType,const DeepCollectionEquality().hash(answers),explanation,orderIndex,levelId,correctAnswer,const DeepCollectionEquality().hash(correctAnswerIndices),characterId);

@override
String toString() {
  return 'GameModuleQuestionEntity(id: $id, question: $question, questionType: $questionType, answers: $answers, explanation: $explanation, orderIndex: $orderIndex, levelId: $levelId, correctAnswer: $correctAnswer, correctAnswerIndices: $correctAnswerIndices, characterId: $characterId)';
}


}

/// @nodoc
abstract mixin class $GameModuleQuestionEntityCopyWith<$Res>  {
  factory $GameModuleQuestionEntityCopyWith(GameModuleQuestionEntity value, $Res Function(GameModuleQuestionEntity) _then) = _$GameModuleQuestionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String question, QuestionType questionType, List<String> answers, String explanation, int orderIndex, int levelId, String? correctAnswer, List<int>? correctAnswerIndices, int? characterId
});




}
/// @nodoc
class _$GameModuleQuestionEntityCopyWithImpl<$Res>
    implements $GameModuleQuestionEntityCopyWith<$Res> {
  _$GameModuleQuestionEntityCopyWithImpl(this._self, this._then);

  final GameModuleQuestionEntity _self;
  final $Res Function(GameModuleQuestionEntity) _then;

/// Create a copy of GameModuleQuestionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? questionType = null,Object? answers = null,Object? explanation = null,Object? orderIndex = null,Object? levelId = null,Object? correctAnswer = freezed,Object? correctAnswerIndices = freezed,Object? characterId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as QuestionType,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String?,correctAnswerIndices: freezed == correctAnswerIndices ? _self.correctAnswerIndices : correctAnswerIndices // ignore: cast_nullable_to_non_nullable
as List<int>?,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModuleQuestionEntity].
extension GameModuleQuestionEntityPatterns on GameModuleQuestionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModuleQuestionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModuleQuestionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModuleQuestionEntity value)  $default,){
final _that = this;
switch (_that) {
case _GameModuleQuestionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModuleQuestionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GameModuleQuestionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String question,  QuestionType questionType,  List<String> answers,  String explanation,  int orderIndex,  int levelId,  String? correctAnswer,  List<int>? correctAnswerIndices,  int? characterId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModuleQuestionEntity() when $default != null:
return $default(_that.id,_that.question,_that.questionType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.correctAnswer,_that.correctAnswerIndices,_that.characterId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String question,  QuestionType questionType,  List<String> answers,  String explanation,  int orderIndex,  int levelId,  String? correctAnswer,  List<int>? correctAnswerIndices,  int? characterId)  $default,) {final _that = this;
switch (_that) {
case _GameModuleQuestionEntity():
return $default(_that.id,_that.question,_that.questionType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.correctAnswer,_that.correctAnswerIndices,_that.characterId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String question,  QuestionType questionType,  List<String> answers,  String explanation,  int orderIndex,  int levelId,  String? correctAnswer,  List<int>? correctAnswerIndices,  int? characterId)?  $default,) {final _that = this;
switch (_that) {
case _GameModuleQuestionEntity() when $default != null:
return $default(_that.id,_that.question,_that.questionType,_that.answers,_that.explanation,_that.orderIndex,_that.levelId,_that.correctAnswer,_that.correctAnswerIndices,_that.characterId);case _:
  return null;

}
}

}

/// @nodoc


class _GameModuleQuestionEntity extends GameModuleQuestionEntity {
  const _GameModuleQuestionEntity({required this.id, required this.question, required this.questionType, required final  List<String> answers, required this.explanation, required this.orderIndex, required this.levelId, this.correctAnswer, final  List<int>? correctAnswerIndices, this.characterId}): _answers = answers,_correctAnswerIndices = correctAnswerIndices,super._();
  

@override final  int id;
@override final  String question;
@override final  QuestionType questionType;
 final  List<String> _answers;
@override List<String> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  String explanation;
@override final  int orderIndex;
@override final  int levelId;
@override final  String? correctAnswer;
// для multiple_choice, true_false, fill_blank
 final  List<int>? _correctAnswerIndices;
// для multiple_choice, true_false, fill_blank
@override List<int>? get correctAnswerIndices {
  final value = _correctAnswerIndices;
  if (value == null) return null;
  if (_correctAnswerIndices is EqualUnmodifiableListView) return _correctAnswerIndices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// для multiple_select
@override final  int? characterId;

/// Create a copy of GameModuleQuestionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModuleQuestionEntityCopyWith<_GameModuleQuestionEntity> get copyWith => __$GameModuleQuestionEntityCopyWithImpl<_GameModuleQuestionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModuleQuestionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&const DeepCollectionEquality().equals(other._correctAnswerIndices, _correctAnswerIndices)&&(identical(other.characterId, characterId) || other.characterId == characterId));
}


@override
int get hashCode => Object.hash(runtimeType,id,question,questionType,const DeepCollectionEquality().hash(_answers),explanation,orderIndex,levelId,correctAnswer,const DeepCollectionEquality().hash(_correctAnswerIndices),characterId);

@override
String toString() {
  return 'GameModuleQuestionEntity(id: $id, question: $question, questionType: $questionType, answers: $answers, explanation: $explanation, orderIndex: $orderIndex, levelId: $levelId, correctAnswer: $correctAnswer, correctAnswerIndices: $correctAnswerIndices, characterId: $characterId)';
}


}

/// @nodoc
abstract mixin class _$GameModuleQuestionEntityCopyWith<$Res> implements $GameModuleQuestionEntityCopyWith<$Res> {
  factory _$GameModuleQuestionEntityCopyWith(_GameModuleQuestionEntity value, $Res Function(_GameModuleQuestionEntity) _then) = __$GameModuleQuestionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String question, QuestionType questionType, List<String> answers, String explanation, int orderIndex, int levelId, String? correctAnswer, List<int>? correctAnswerIndices, int? characterId
});




}
/// @nodoc
class __$GameModuleQuestionEntityCopyWithImpl<$Res>
    implements _$GameModuleQuestionEntityCopyWith<$Res> {
  __$GameModuleQuestionEntityCopyWithImpl(this._self, this._then);

  final _GameModuleQuestionEntity _self;
  final $Res Function(_GameModuleQuestionEntity) _then;

/// Create a copy of GameModuleQuestionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? questionType = null,Object? answers = null,Object? explanation = null,Object? orderIndex = null,Object? levelId = null,Object? correctAnswer = freezed,Object? correctAnswerIndices = freezed,Object? characterId = freezed,}) {
  return _then(_GameModuleQuestionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as QuestionType,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String?,correctAnswerIndices: freezed == correctAnswerIndices ? _self._correctAnswerIndices : correctAnswerIndices // ignore: cast_nullable_to_non_nullable
as List<int>?,characterId: freezed == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
