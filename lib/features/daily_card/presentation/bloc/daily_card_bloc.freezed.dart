// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyCardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardState()';
}


}

/// @nodoc
class $DailyCardStateCopyWith<$Res>  {
$DailyCardStateCopyWith(DailyCardState _, $Res Function(DailyCardState) __);
}


/// Adds pattern-matching-related methods to [DailyCardState].
extension DailyCardStatePatterns on DailyCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Answered value)?  answered,TResult Function( NoMoreCards value)?  noMoreCards,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Answered() when answered != null:
return answered(_that);case NoMoreCards() when noMoreCards != null:
return noMoreCards(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Answered value)  answered,required TResult Function( NoMoreCards value)  noMoreCards,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Answered():
return answered(_that);case NoMoreCards():
return noMoreCards(_that);case Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Answered value)?  answered,TResult? Function( NoMoreCards value)?  noMoreCards,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Answered() when answered != null:
return answered(_that);case NoMoreCards() when noMoreCards != null:
return noMoreCards(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DailyCardEntity card,  bool hasAnsweredToday)?  loaded,TResult Function( bool isCorrect,  String explanation)?  answered,TResult Function()?  noMoreCards,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.card,_that.hasAnsweredToday);case Answered() when answered != null:
return answered(_that.isCorrect,_that.explanation);case NoMoreCards() when noMoreCards != null:
return noMoreCards();case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DailyCardEntity card,  bool hasAnsweredToday)  loaded,required TResult Function( bool isCorrect,  String explanation)  answered,required TResult Function()  noMoreCards,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.card,_that.hasAnsweredToday);case Answered():
return answered(_that.isCorrect,_that.explanation);case NoMoreCards():
return noMoreCards();case Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DailyCardEntity card,  bool hasAnsweredToday)?  loaded,TResult? Function( bool isCorrect,  String explanation)?  answered,TResult? Function()?  noMoreCards,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.card,_that.hasAnsweredToday);case Answered() when answered != null:
return answered(_that.isCorrect,_that.explanation);case NoMoreCards() when noMoreCards != null:
return noMoreCards();case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DailyCardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardState.initial()';
}


}




/// @nodoc


class Loading implements DailyCardState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardState.loading()';
}


}




/// @nodoc


class Loaded implements DailyCardState {
  const Loaded({required this.card, required this.hasAnsweredToday});
  

 final  DailyCardEntity card;
 final  bool hasAnsweredToday;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.card, card) || other.card == card)&&(identical(other.hasAnsweredToday, hasAnsweredToday) || other.hasAnsweredToday == hasAnsweredToday));
}


@override
int get hashCode => Object.hash(runtimeType,card,hasAnsweredToday);

@override
String toString() {
  return 'DailyCardState.loaded(card: $card, hasAnsweredToday: $hasAnsweredToday)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $DailyCardStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 DailyCardEntity card, bool hasAnsweredToday
});


$DailyCardEntityCopyWith<$Res> get card;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? card = null,Object? hasAnsweredToday = null,}) {
  return _then(Loaded(
card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as DailyCardEntity,hasAnsweredToday: null == hasAnsweredToday ? _self.hasAnsweredToday : hasAnsweredToday // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCardEntityCopyWith<$Res> get card {
  
  return $DailyCardEntityCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

/// @nodoc


class Answered implements DailyCardState {
  const Answered({required this.isCorrect, required this.explanation});
  

 final  bool isCorrect;
 final  String explanation;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnsweredCopyWith<Answered> get copyWith => _$AnsweredCopyWithImpl<Answered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Answered&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,explanation);

@override
String toString() {
  return 'DailyCardState.answered(isCorrect: $isCorrect, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $AnsweredCopyWith<$Res> implements $DailyCardStateCopyWith<$Res> {
  factory $AnsweredCopyWith(Answered value, $Res Function(Answered) _then) = _$AnsweredCopyWithImpl;
@useResult
$Res call({
 bool isCorrect, String explanation
});




}
/// @nodoc
class _$AnsweredCopyWithImpl<$Res>
    implements $AnsweredCopyWith<$Res> {
  _$AnsweredCopyWithImpl(this._self, this._then);

  final Answered _self;
  final $Res Function(Answered) _then;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? explanation = null,}) {
  return _then(Answered(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NoMoreCards implements DailyCardState {
  const NoMoreCards();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoMoreCards);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardState.noMoreCards()';
}


}




/// @nodoc


class Error implements DailyCardState {
  const Error({required this.message});
  

 final  String message;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyCardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $DailyCardStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of DailyCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DailyCardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardEvent()';
}


}

/// @nodoc
class $DailyCardEventCopyWith<$Res>  {
$DailyCardEventCopyWith(DailyCardEvent _, $Res Function(DailyCardEvent) __);
}


/// Adds pattern-matching-related methods to [DailyCardEvent].
extension DailyCardEventPatterns on DailyCardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTodayCard value)?  loadTodayCard,TResult Function( _AnswerCard value)?  answerCard,TResult Function( _Close value)?  close,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTodayCard() when loadTodayCard != null:
return loadTodayCard(_that);case _AnswerCard() when answerCard != null:
return answerCard(_that);case _Close() when close != null:
return close(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTodayCard value)  loadTodayCard,required TResult Function( _AnswerCard value)  answerCard,required TResult Function( _Close value)  close,}){
final _that = this;
switch (_that) {
case _LoadTodayCard():
return loadTodayCard(_that);case _AnswerCard():
return answerCard(_that);case _Close():
return close(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTodayCard value)?  loadTodayCard,TResult? Function( _AnswerCard value)?  answerCard,TResult? Function( _Close value)?  close,}){
final _that = this;
switch (_that) {
case _LoadTodayCard() when loadTodayCard != null:
return loadTodayCard(_that);case _AnswerCard() when answerCard != null:
return answerCard(_that);case _Close() when close != null:
return close(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTodayCard,TResult Function( int cardId,  bool isCorrect,  String explanation)?  answerCard,TResult Function()?  close,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTodayCard() when loadTodayCard != null:
return loadTodayCard();case _AnswerCard() when answerCard != null:
return answerCard(_that.cardId,_that.isCorrect,_that.explanation);case _Close() when close != null:
return close();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTodayCard,required TResult Function( int cardId,  bool isCorrect,  String explanation)  answerCard,required TResult Function()  close,}) {final _that = this;
switch (_that) {
case _LoadTodayCard():
return loadTodayCard();case _AnswerCard():
return answerCard(_that.cardId,_that.isCorrect,_that.explanation);case _Close():
return close();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTodayCard,TResult? Function( int cardId,  bool isCorrect,  String explanation)?  answerCard,TResult? Function()?  close,}) {final _that = this;
switch (_that) {
case _LoadTodayCard() when loadTodayCard != null:
return loadTodayCard();case _AnswerCard() when answerCard != null:
return answerCard(_that.cardId,_that.isCorrect,_that.explanation);case _Close() when close != null:
return close();case _:
  return null;

}
}

}

/// @nodoc


class _LoadTodayCard implements DailyCardEvent {
  const _LoadTodayCard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTodayCard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardEvent.loadTodayCard()';
}


}




/// @nodoc


class _AnswerCard implements DailyCardEvent {
  const _AnswerCard({required this.cardId, required this.isCorrect, required this.explanation});
  

 final  int cardId;
 final  bool isCorrect;
 final  String explanation;

/// Create a copy of DailyCardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerCardCopyWith<_AnswerCard> get copyWith => __$AnswerCardCopyWithImpl<_AnswerCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerCard&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}


@override
int get hashCode => Object.hash(runtimeType,cardId,isCorrect,explanation);

@override
String toString() {
  return 'DailyCardEvent.answerCard(cardId: $cardId, isCorrect: $isCorrect, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$AnswerCardCopyWith<$Res> implements $DailyCardEventCopyWith<$Res> {
  factory _$AnswerCardCopyWith(_AnswerCard value, $Res Function(_AnswerCard) _then) = __$AnswerCardCopyWithImpl;
@useResult
$Res call({
 int cardId, bool isCorrect, String explanation
});




}
/// @nodoc
class __$AnswerCardCopyWithImpl<$Res>
    implements _$AnswerCardCopyWith<$Res> {
  __$AnswerCardCopyWithImpl(this._self, this._then);

  final _AnswerCard _self;
  final $Res Function(_AnswerCard) _then;

/// Create a copy of DailyCardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? isCorrect = null,Object? explanation = null,}) {
  return _then(_AnswerCard(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Close implements DailyCardEvent {
  const _Close();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Close);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyCardEvent.close()';
}


}




// dart format on
