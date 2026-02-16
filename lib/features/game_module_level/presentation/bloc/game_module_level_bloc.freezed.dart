// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_level_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameModuleLevelEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleLevelEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelEvent()';
}


}

/// @nodoc
class $GameModuleLevelEventCopyWith<$Res>  {
$GameModuleLevelEventCopyWith(GameModuleLevelEvent _, $Res Function(GameModuleLevelEvent) __);
}


/// Adds pattern-matching-related methods to [GameModuleLevelEvent].
extension GameModuleLevelEventPatterns on GameModuleLevelEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Receive value)?  receive,TResult Function( _AnswerMultipleChoice value)?  answerMultipleChoice,TResult Function( _AnswerTrueFalse value)?  answerTrueFalse,TResult Function( _AnswerFillBlank value)?  answerFillBlank,TResult Function( _NextQuestion value)?  nextQuestion,TResult Function( _RetryLevel value)?  retryLevel,TResult Function( _StartLevel value)?  startLevel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that);case _AnswerMultipleChoice() when answerMultipleChoice != null:
return answerMultipleChoice(_that);case _AnswerTrueFalse() when answerTrueFalse != null:
return answerTrueFalse(_that);case _AnswerFillBlank() when answerFillBlank != null:
return answerFillBlank(_that);case _NextQuestion() when nextQuestion != null:
return nextQuestion(_that);case _RetryLevel() when retryLevel != null:
return retryLevel(_that);case _StartLevel() when startLevel != null:
return startLevel(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Receive value)  receive,required TResult Function( _AnswerMultipleChoice value)  answerMultipleChoice,required TResult Function( _AnswerTrueFalse value)  answerTrueFalse,required TResult Function( _AnswerFillBlank value)  answerFillBlank,required TResult Function( _NextQuestion value)  nextQuestion,required TResult Function( _RetryLevel value)  retryLevel,required TResult Function( _StartLevel value)  startLevel,}){
final _that = this;
switch (_that) {
case _Receive():
return receive(_that);case _AnswerMultipleChoice():
return answerMultipleChoice(_that);case _AnswerTrueFalse():
return answerTrueFalse(_that);case _AnswerFillBlank():
return answerFillBlank(_that);case _NextQuestion():
return nextQuestion(_that);case _RetryLevel():
return retryLevel(_that);case _StartLevel():
return startLevel(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Receive value)?  receive,TResult? Function( _AnswerMultipleChoice value)?  answerMultipleChoice,TResult? Function( _AnswerTrueFalse value)?  answerTrueFalse,TResult? Function( _AnswerFillBlank value)?  answerFillBlank,TResult? Function( _NextQuestion value)?  nextQuestion,TResult? Function( _RetryLevel value)?  retryLevel,TResult? Function( _StartLevel value)?  startLevel,}){
final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that);case _AnswerMultipleChoice() when answerMultipleChoice != null:
return answerMultipleChoice(_that);case _AnswerTrueFalse() when answerTrueFalse != null:
return answerTrueFalse(_that);case _AnswerFillBlank() when answerFillBlank != null:
return answerFillBlank(_that);case _NextQuestion() when nextQuestion != null:
return nextQuestion(_that);case _RetryLevel() when retryLevel != null:
return retryLevel(_that);case _StartLevel() when startLevel != null:
return startLevel(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int levelId,  AgeCategory ageCategory)?  receive,TResult Function( String answer)?  answerMultipleChoice,TResult Function( bool answer)?  answerTrueFalse,TResult Function( String answer)?  answerFillBlank,TResult Function()?  nextQuestion,TResult Function()?  retryLevel,TResult Function()?  startLevel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that.levelId,_that.ageCategory);case _AnswerMultipleChoice() when answerMultipleChoice != null:
return answerMultipleChoice(_that.answer);case _AnswerTrueFalse() when answerTrueFalse != null:
return answerTrueFalse(_that.answer);case _AnswerFillBlank() when answerFillBlank != null:
return answerFillBlank(_that.answer);case _NextQuestion() when nextQuestion != null:
return nextQuestion();case _RetryLevel() when retryLevel != null:
return retryLevel();case _StartLevel() when startLevel != null:
return startLevel();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int levelId,  AgeCategory ageCategory)  receive,required TResult Function( String answer)  answerMultipleChoice,required TResult Function( bool answer)  answerTrueFalse,required TResult Function( String answer)  answerFillBlank,required TResult Function()  nextQuestion,required TResult Function()  retryLevel,required TResult Function()  startLevel,}) {final _that = this;
switch (_that) {
case _Receive():
return receive(_that.levelId,_that.ageCategory);case _AnswerMultipleChoice():
return answerMultipleChoice(_that.answer);case _AnswerTrueFalse():
return answerTrueFalse(_that.answer);case _AnswerFillBlank():
return answerFillBlank(_that.answer);case _NextQuestion():
return nextQuestion();case _RetryLevel():
return retryLevel();case _StartLevel():
return startLevel();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int levelId,  AgeCategory ageCategory)?  receive,TResult? Function( String answer)?  answerMultipleChoice,TResult? Function( bool answer)?  answerTrueFalse,TResult? Function( String answer)?  answerFillBlank,TResult? Function()?  nextQuestion,TResult? Function()?  retryLevel,TResult? Function()?  startLevel,}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that.levelId,_that.ageCategory);case _AnswerMultipleChoice() when answerMultipleChoice != null:
return answerMultipleChoice(_that.answer);case _AnswerTrueFalse() when answerTrueFalse != null:
return answerTrueFalse(_that.answer);case _AnswerFillBlank() when answerFillBlank != null:
return answerFillBlank(_that.answer);case _NextQuestion() when nextQuestion != null:
return nextQuestion();case _RetryLevel() when retryLevel != null:
return retryLevel();case _StartLevel() when startLevel != null:
return startLevel();case _:
  return null;

}
}

}

/// @nodoc


class _Receive implements GameModuleLevelEvent {
  const _Receive({required this.levelId, required this.ageCategory});
  

 final  int levelId;
 final  AgeCategory ageCategory;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiveCopyWith<_Receive> get copyWith => __$ReceiveCopyWithImpl<_Receive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receive&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.ageCategory, ageCategory) || other.ageCategory == ageCategory));
}


@override
int get hashCode => Object.hash(runtimeType,levelId,ageCategory);

@override
String toString() {
  return 'GameModuleLevelEvent.receive(levelId: $levelId, ageCategory: $ageCategory)';
}


}

/// @nodoc
abstract mixin class _$ReceiveCopyWith<$Res> implements $GameModuleLevelEventCopyWith<$Res> {
  factory _$ReceiveCopyWith(_Receive value, $Res Function(_Receive) _then) = __$ReceiveCopyWithImpl;
@useResult
$Res call({
 int levelId, AgeCategory ageCategory
});




}
/// @nodoc
class __$ReceiveCopyWithImpl<$Res>
    implements _$ReceiveCopyWith<$Res> {
  __$ReceiveCopyWithImpl(this._self, this._then);

  final _Receive _self;
  final $Res Function(_Receive) _then;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? levelId = null,Object? ageCategory = null,}) {
  return _then(_Receive(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,ageCategory: null == ageCategory ? _self.ageCategory : ageCategory // ignore: cast_nullable_to_non_nullable
as AgeCategory,
  ));
}


}

/// @nodoc


class _AnswerMultipleChoice implements GameModuleLevelEvent {
  const _AnswerMultipleChoice({required this.answer});
  

 final  String answer;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerMultipleChoiceCopyWith<_AnswerMultipleChoice> get copyWith => __$AnswerMultipleChoiceCopyWithImpl<_AnswerMultipleChoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerMultipleChoice&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,answer);

@override
String toString() {
  return 'GameModuleLevelEvent.answerMultipleChoice(answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AnswerMultipleChoiceCopyWith<$Res> implements $GameModuleLevelEventCopyWith<$Res> {
  factory _$AnswerMultipleChoiceCopyWith(_AnswerMultipleChoice value, $Res Function(_AnswerMultipleChoice) _then) = __$AnswerMultipleChoiceCopyWithImpl;
@useResult
$Res call({
 String answer
});




}
/// @nodoc
class __$AnswerMultipleChoiceCopyWithImpl<$Res>
    implements _$AnswerMultipleChoiceCopyWith<$Res> {
  __$AnswerMultipleChoiceCopyWithImpl(this._self, this._then);

  final _AnswerMultipleChoice _self;
  final $Res Function(_AnswerMultipleChoice) _then;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? answer = null,}) {
  return _then(_AnswerMultipleChoice(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AnswerTrueFalse implements GameModuleLevelEvent {
  const _AnswerTrueFalse({required this.answer});
  

 final  bool answer;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerTrueFalseCopyWith<_AnswerTrueFalse> get copyWith => __$AnswerTrueFalseCopyWithImpl<_AnswerTrueFalse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerTrueFalse&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,answer);

@override
String toString() {
  return 'GameModuleLevelEvent.answerTrueFalse(answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AnswerTrueFalseCopyWith<$Res> implements $GameModuleLevelEventCopyWith<$Res> {
  factory _$AnswerTrueFalseCopyWith(_AnswerTrueFalse value, $Res Function(_AnswerTrueFalse) _then) = __$AnswerTrueFalseCopyWithImpl;
@useResult
$Res call({
 bool answer
});




}
/// @nodoc
class __$AnswerTrueFalseCopyWithImpl<$Res>
    implements _$AnswerTrueFalseCopyWith<$Res> {
  __$AnswerTrueFalseCopyWithImpl(this._self, this._then);

  final _AnswerTrueFalse _self;
  final $Res Function(_AnswerTrueFalse) _then;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? answer = null,}) {
  return _then(_AnswerTrueFalse(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _AnswerFillBlank implements GameModuleLevelEvent {
  const _AnswerFillBlank({required this.answer});
  

 final  String answer;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerFillBlankCopyWith<_AnswerFillBlank> get copyWith => __$AnswerFillBlankCopyWithImpl<_AnswerFillBlank>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerFillBlank&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,answer);

@override
String toString() {
  return 'GameModuleLevelEvent.answerFillBlank(answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AnswerFillBlankCopyWith<$Res> implements $GameModuleLevelEventCopyWith<$Res> {
  factory _$AnswerFillBlankCopyWith(_AnswerFillBlank value, $Res Function(_AnswerFillBlank) _then) = __$AnswerFillBlankCopyWithImpl;
@useResult
$Res call({
 String answer
});




}
/// @nodoc
class __$AnswerFillBlankCopyWithImpl<$Res>
    implements _$AnswerFillBlankCopyWith<$Res> {
  __$AnswerFillBlankCopyWithImpl(this._self, this._then);

  final _AnswerFillBlank _self;
  final $Res Function(_AnswerFillBlank) _then;

/// Create a copy of GameModuleLevelEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? answer = null,}) {
  return _then(_AnswerFillBlank(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NextQuestion implements GameModuleLevelEvent {
  const _NextQuestion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextQuestion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelEvent.nextQuestion()';
}


}




/// @nodoc


class _RetryLevel implements GameModuleLevelEvent {
  const _RetryLevel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLevel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelEvent.retryLevel()';
}


}




/// @nodoc


class _StartLevel implements GameModuleLevelEvent {
  const _StartLevel();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartLevel);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelEvent.startLevel()';
}


}




/// @nodoc
mixin _$GameModuleLevelState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleLevelState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelState()';
}


}

/// @nodoc
class $GameModuleLevelStateCopyWith<$Res>  {
$GameModuleLevelStateCopyWith(GameModuleLevelState _, $Res Function(GameModuleLevelState) __);
}


/// Adds pattern-matching-related methods to [GameModuleLevelState].
extension GameModuleLevelStatePatterns on GameModuleLevelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ReceiveInProgress value)?  receiveInProgress,TResult Function( ReceiveSuccess value)?  receiveSuccess,TResult Function( ReceiveFailed value)?  receiveFailed,TResult Function( AnswerInProgress value)?  answerInProgress,TResult Function( LevelCompleted value)?  levelCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case AnswerInProgress() when answerInProgress != null:
return answerInProgress(_that);case LevelCompleted() when levelCompleted != null:
return levelCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ReceiveInProgress value)  receiveInProgress,required TResult Function( ReceiveSuccess value)  receiveSuccess,required TResult Function( ReceiveFailed value)  receiveFailed,required TResult Function( AnswerInProgress value)  answerInProgress,required TResult Function( LevelCompleted value)  levelCompleted,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ReceiveInProgress():
return receiveInProgress(_that);case ReceiveSuccess():
return receiveSuccess(_that);case ReceiveFailed():
return receiveFailed(_that);case AnswerInProgress():
return answerInProgress(_that);case LevelCompleted():
return levelCompleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ReceiveInProgress value)?  receiveInProgress,TResult? Function( ReceiveSuccess value)?  receiveSuccess,TResult? Function( ReceiveFailed value)?  receiveFailed,TResult? Function( AnswerInProgress value)?  answerInProgress,TResult? Function( LevelCompleted value)?  levelCompleted,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case AnswerInProgress() when answerInProgress != null:
return answerInProgress(_that);case LevelCompleted() when levelCompleted != null:
return levelCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  receiveInProgress,TResult Function( List<GameModuleQuestionEntity> questions,  int currentIndex,  LevelProgressEntity? progress,  bool isAnswered)?  receiveSuccess,TResult Function( String message)?  receiveFailed,TResult Function( bool isCorrect,  String explanation,  String selectedAnswer,  String correctAnswer)?  answerInProgress,TResult Function()?  levelCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.questions,_that.currentIndex,_that.progress,_that.isAnswered);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case AnswerInProgress() when answerInProgress != null:
return answerInProgress(_that.isCorrect,_that.explanation,_that.selectedAnswer,_that.correctAnswer);case LevelCompleted() when levelCompleted != null:
return levelCompleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  receiveInProgress,required TResult Function( List<GameModuleQuestionEntity> questions,  int currentIndex,  LevelProgressEntity? progress,  bool isAnswered)  receiveSuccess,required TResult Function( String message)  receiveFailed,required TResult Function( bool isCorrect,  String explanation,  String selectedAnswer,  String correctAnswer)  answerInProgress,required TResult Function()  levelCompleted,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ReceiveInProgress():
return receiveInProgress(_that.message);case ReceiveSuccess():
return receiveSuccess(_that.questions,_that.currentIndex,_that.progress,_that.isAnswered);case ReceiveFailed():
return receiveFailed(_that.message);case AnswerInProgress():
return answerInProgress(_that.isCorrect,_that.explanation,_that.selectedAnswer,_that.correctAnswer);case LevelCompleted():
return levelCompleted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  receiveInProgress,TResult? Function( List<GameModuleQuestionEntity> questions,  int currentIndex,  LevelProgressEntity? progress,  bool isAnswered)?  receiveSuccess,TResult? Function( String message)?  receiveFailed,TResult? Function( bool isCorrect,  String explanation,  String selectedAnswer,  String correctAnswer)?  answerInProgress,TResult? Function()?  levelCompleted,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.questions,_that.currentIndex,_that.progress,_that.isAnswered);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case AnswerInProgress() when answerInProgress != null:
return answerInProgress(_that.isCorrect,_that.explanation,_that.selectedAnswer,_that.correctAnswer);case LevelCompleted() when levelCompleted != null:
return levelCompleted();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GameModuleLevelState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelState.initial()';
}


}




/// @nodoc


class ReceiveInProgress implements GameModuleLevelState {
  const ReceiveInProgress({required this.message});
  

 final  String message;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveInProgressCopyWith<ReceiveInProgress> get copyWith => _$ReceiveInProgressCopyWithImpl<ReceiveInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveInProgress&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GameModuleLevelState.receiveInProgress(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveInProgressCopyWith<$Res> implements $GameModuleLevelStateCopyWith<$Res> {
  factory $ReceiveInProgressCopyWith(ReceiveInProgress value, $Res Function(ReceiveInProgress) _then) = _$ReceiveInProgressCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReceiveInProgressCopyWithImpl<$Res>
    implements $ReceiveInProgressCopyWith<$Res> {
  _$ReceiveInProgressCopyWithImpl(this._self, this._then);

  final ReceiveInProgress _self;
  final $Res Function(ReceiveInProgress) _then;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveInProgress(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReceiveSuccess implements GameModuleLevelState {
  const ReceiveSuccess({required final  List<GameModuleQuestionEntity> questions, required this.currentIndex, required this.progress, required this.isAnswered}): _questions = questions;
  

 final  List<GameModuleQuestionEntity> _questions;
 List<GameModuleQuestionEntity> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  int currentIndex;
 final  LevelProgressEntity? progress;
 final  bool isAnswered;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveSuccessCopyWith<ReceiveSuccess> get copyWith => _$ReceiveSuccessCopyWithImpl<ReceiveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveSuccess&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),currentIndex,progress,isAnswered);

@override
String toString() {
  return 'GameModuleLevelState.receiveSuccess(questions: $questions, currentIndex: $currentIndex, progress: $progress, isAnswered: $isAnswered)';
}


}

/// @nodoc
abstract mixin class $ReceiveSuccessCopyWith<$Res> implements $GameModuleLevelStateCopyWith<$Res> {
  factory $ReceiveSuccessCopyWith(ReceiveSuccess value, $Res Function(ReceiveSuccess) _then) = _$ReceiveSuccessCopyWithImpl;
@useResult
$Res call({
 List<GameModuleQuestionEntity> questions, int currentIndex, LevelProgressEntity? progress, bool isAnswered
});


$LevelProgressEntityCopyWith<$Res>? get progress;

}
/// @nodoc
class _$ReceiveSuccessCopyWithImpl<$Res>
    implements $ReceiveSuccessCopyWith<$Res> {
  _$ReceiveSuccessCopyWithImpl(this._self, this._then);

  final ReceiveSuccess _self;
  final $Res Function(ReceiveSuccess) _then;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? currentIndex = null,Object? progress = freezed,Object? isAnswered = null,}) {
  return _then(ReceiveSuccess(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<GameModuleQuestionEntity>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as LevelProgressEntity?,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelProgressEntityCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $LevelProgressEntityCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

/// @nodoc


class ReceiveFailed implements GameModuleLevelState {
  const ReceiveFailed({required this.message});
  

 final  String message;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveFailedCopyWith<ReceiveFailed> get copyWith => _$ReceiveFailedCopyWithImpl<ReceiveFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GameModuleLevelState.receiveFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveFailedCopyWith<$Res> implements $GameModuleLevelStateCopyWith<$Res> {
  factory $ReceiveFailedCopyWith(ReceiveFailed value, $Res Function(ReceiveFailed) _then) = _$ReceiveFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReceiveFailedCopyWithImpl<$Res>
    implements $ReceiveFailedCopyWith<$Res> {
  _$ReceiveFailedCopyWithImpl(this._self, this._then);

  final ReceiveFailed _self;
  final $Res Function(ReceiveFailed) _then;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AnswerInProgress implements GameModuleLevelState {
  const AnswerInProgress({required this.isCorrect, required this.explanation, required this.selectedAnswer, required this.correctAnswer});
  

 final  bool isCorrect;
 final  String explanation;
 final  String selectedAnswer;
 final  String correctAnswer;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerInProgressCopyWith<AnswerInProgress> get copyWith => _$AnswerInProgressCopyWithImpl<AnswerInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerInProgress&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.selectedAnswer, selectedAnswer) || other.selectedAnswer == selectedAnswer)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,explanation,selectedAnswer,correctAnswer);

@override
String toString() {
  return 'GameModuleLevelState.answerInProgress(isCorrect: $isCorrect, explanation: $explanation, selectedAnswer: $selectedAnswer, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class $AnswerInProgressCopyWith<$Res> implements $GameModuleLevelStateCopyWith<$Res> {
  factory $AnswerInProgressCopyWith(AnswerInProgress value, $Res Function(AnswerInProgress) _then) = _$AnswerInProgressCopyWithImpl;
@useResult
$Res call({
 bool isCorrect, String explanation, String selectedAnswer, String correctAnswer
});




}
/// @nodoc
class _$AnswerInProgressCopyWithImpl<$Res>
    implements $AnswerInProgressCopyWith<$Res> {
  _$AnswerInProgressCopyWithImpl(this._self, this._then);

  final AnswerInProgress _self;
  final $Res Function(AnswerInProgress) _then;

/// Create a copy of GameModuleLevelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? explanation = null,Object? selectedAnswer = null,Object? correctAnswer = null,}) {
  return _then(AnswerInProgress(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,selectedAnswer: null == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LevelCompleted implements GameModuleLevelState {
  const LevelCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleLevelState.levelCompleted()';
}


}




// dart format on
