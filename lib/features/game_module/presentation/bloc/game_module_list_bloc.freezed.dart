// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameModuleListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleListEvent()';
}


}

/// @nodoc
class $GameModuleListEventCopyWith<$Res>  {
$GameModuleListEventCopyWith(GameModuleListEvent _, $Res Function(GameModuleListEvent) __);
}


/// Adds pattern-matching-related methods to [GameModuleListEvent].
extension GameModuleListEventPatterns on GameModuleListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Receive value)?  receive,TResult Function( _Select value)?  select,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that);case _Select() when select != null:
return select(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Receive value)  receive,required TResult Function( _Select value)  select,}){
final _that = this;
switch (_that) {
case _Receive():
return receive(_that);case _Select():
return select(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Receive value)?  receive,TResult? Function( _Select value)?  select,}){
final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive(_that);case _Select() when select != null:
return select(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  receive,TResult Function( int levelId,  AgeCategory ageCategory)?  select,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive();case _Select() when select != null:
return select(_that.levelId,_that.ageCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  receive,required TResult Function( int levelId,  AgeCategory ageCategory)  select,}) {final _that = this;
switch (_that) {
case _Receive():
return receive();case _Select():
return select(_that.levelId,_that.ageCategory);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  receive,TResult? Function( int levelId,  AgeCategory ageCategory)?  select,}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive();case _Select() when select != null:
return select(_that.levelId,_that.ageCategory);case _:
  return null;

}
}

}

/// @nodoc


class _Receive implements GameModuleListEvent {
  const _Receive();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receive);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleListEvent.receive()';
}


}




/// @nodoc


class _Select implements GameModuleListEvent {
  const _Select({required this.levelId, required this.ageCategory});
  

 final  int levelId;
 final  AgeCategory ageCategory;

/// Create a copy of GameModuleListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCopyWith<_Select> get copyWith => __$SelectCopyWithImpl<_Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Select&&(identical(other.levelId, levelId) || other.levelId == levelId)&&(identical(other.ageCategory, ageCategory) || other.ageCategory == ageCategory));
}


@override
int get hashCode => Object.hash(runtimeType,levelId,ageCategory);

@override
String toString() {
  return 'GameModuleListEvent.select(levelId: $levelId, ageCategory: $ageCategory)';
}


}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res> implements $GameModuleListEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) = __$SelectCopyWithImpl;
@useResult
$Res call({
 int levelId, AgeCategory ageCategory
});




}
/// @nodoc
class __$SelectCopyWithImpl<$Res>
    implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

/// Create a copy of GameModuleListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? levelId = null,Object? ageCategory = null,}) {
  return _then(_Select(
levelId: null == levelId ? _self.levelId : levelId // ignore: cast_nullable_to_non_nullable
as int,ageCategory: null == ageCategory ? _self.ageCategory : ageCategory // ignore: cast_nullable_to_non_nullable
as AgeCategory,
  ));
}


}

/// @nodoc
mixin _$GameModuleListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleListState()';
}


}

/// @nodoc
class $GameModuleListStateCopyWith<$Res>  {
$GameModuleListStateCopyWith(GameModuleListState _, $Res Function(GameModuleListState) __);
}


/// Adds pattern-matching-related methods to [GameModuleListState].
extension GameModuleListStatePatterns on GameModuleListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ReceiveInProgress value)?  receiveInProgress,TResult Function( ReceiveSuccess value)?  receiveSuccess,TResult Function( ReceiveFailed value)?  receiveFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ReceiveInProgress value)  receiveInProgress,required TResult Function( ReceiveSuccess value)  receiveSuccess,required TResult Function( ReceiveFailed value)  receiveFailed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ReceiveInProgress():
return receiveInProgress(_that);case ReceiveSuccess():
return receiveSuccess(_that);case ReceiveFailed():
return receiveFailed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ReceiveInProgress value)?  receiveInProgress,TResult? Function( ReceiveSuccess value)?  receiveSuccess,TResult? Function( ReceiveFailed value)?  receiveFailed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  receiveInProgress,TResult Function( List<GameModuleListEntity> gameModules)?  receiveSuccess,TResult Function( String message)?  receiveFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.gameModules);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  receiveInProgress,required TResult Function( List<GameModuleListEntity> gameModules)  receiveSuccess,required TResult Function( String message)  receiveFailed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ReceiveInProgress():
return receiveInProgress(_that.message);case ReceiveSuccess():
return receiveSuccess(_that.gameModules);case ReceiveFailed():
return receiveFailed(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  receiveInProgress,TResult? Function( List<GameModuleListEntity> gameModules)?  receiveSuccess,TResult? Function( String message)?  receiveFailed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.gameModules);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GameModuleListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameModuleListState.initial()';
}


}




/// @nodoc


class ReceiveInProgress implements GameModuleListState {
  const ReceiveInProgress({required this.message});
  

 final  String message;

/// Create a copy of GameModuleListState
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
  return 'GameModuleListState.receiveInProgress(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveInProgressCopyWith<$Res> implements $GameModuleListStateCopyWith<$Res> {
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

/// Create a copy of GameModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveInProgress(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReceiveSuccess implements GameModuleListState {
  const ReceiveSuccess({required final  List<GameModuleListEntity> gameModules}): _gameModules = gameModules;
  

 final  List<GameModuleListEntity> _gameModules;
 List<GameModuleListEntity> get gameModules {
  if (_gameModules is EqualUnmodifiableListView) return _gameModules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gameModules);
}


/// Create a copy of GameModuleListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveSuccessCopyWith<ReceiveSuccess> get copyWith => _$ReceiveSuccessCopyWithImpl<ReceiveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveSuccess&&const DeepCollectionEquality().equals(other._gameModules, _gameModules));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_gameModules));

@override
String toString() {
  return 'GameModuleListState.receiveSuccess(gameModules: $gameModules)';
}


}

/// @nodoc
abstract mixin class $ReceiveSuccessCopyWith<$Res> implements $GameModuleListStateCopyWith<$Res> {
  factory $ReceiveSuccessCopyWith(ReceiveSuccess value, $Res Function(ReceiveSuccess) _then) = _$ReceiveSuccessCopyWithImpl;
@useResult
$Res call({
 List<GameModuleListEntity> gameModules
});




}
/// @nodoc
class _$ReceiveSuccessCopyWithImpl<$Res>
    implements $ReceiveSuccessCopyWith<$Res> {
  _$ReceiveSuccessCopyWithImpl(this._self, this._then);

  final ReceiveSuccess _self;
  final $Res Function(ReceiveSuccess) _then;

/// Create a copy of GameModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gameModules = null,}) {
  return _then(ReceiveSuccess(
gameModules: null == gameModules ? _self._gameModules : gameModules // ignore: cast_nullable_to_non_nullable
as List<GameModuleListEntity>,
  ));
}


}

/// @nodoc


class ReceiveFailed implements GameModuleListState {
  const ReceiveFailed({required this.message});
  

 final  String message;

/// Create a copy of GameModuleListState
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
  return 'GameModuleListState.receiveFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveFailedCopyWith<$Res> implements $GameModuleListStateCopyWith<$Res> {
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

/// Create a copy of GameModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
