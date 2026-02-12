// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theory_module_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TheoryModuleListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TheoryModuleListState()';
}


}

/// @nodoc
class $TheoryModuleListStateCopyWith<$Res>  {
$TheoryModuleListStateCopyWith(TheoryModuleListState _, $Res Function(TheoryModuleListState) __);
}


/// Adds pattern-matching-related methods to [TheoryModuleListState].
extension TheoryModuleListStatePatterns on TheoryModuleListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ReceiveInProgress value)?  receiveInProgress,TResult Function( ReceiveSuccess value)?  receiveSuccess,TResult Function( ReceiveFailed value)?  receiveFailed,TResult Function( Selected value)?  selected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case Selected() when selected != null:
return selected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ReceiveInProgress value)  receiveInProgress,required TResult Function( ReceiveSuccess value)  receiveSuccess,required TResult Function( ReceiveFailed value)  receiveFailed,required TResult Function( Selected value)  selected,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ReceiveInProgress():
return receiveInProgress(_that);case ReceiveSuccess():
return receiveSuccess(_that);case ReceiveFailed():
return receiveFailed(_that);case Selected():
return selected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ReceiveInProgress value)?  receiveInProgress,TResult? Function( ReceiveSuccess value)?  receiveSuccess,TResult? Function( ReceiveFailed value)?  receiveFailed,TResult? Function( Selected value)?  selected,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that);case Selected() when selected != null:
return selected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String message)?  receiveInProgress,TResult Function( List<TheoryModuleEntity> theoryModules)?  receiveSuccess,TResult Function( String message)?  receiveFailed,TResult Function( int theoryModuleId)?  selected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.theoryModules);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case Selected() when selected != null:
return selected(_that.theoryModuleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String message)  receiveInProgress,required TResult Function( List<TheoryModuleEntity> theoryModules)  receiveSuccess,required TResult Function( String message)  receiveFailed,required TResult Function( int theoryModuleId)  selected,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ReceiveInProgress():
return receiveInProgress(_that.message);case ReceiveSuccess():
return receiveSuccess(_that.theoryModules);case ReceiveFailed():
return receiveFailed(_that.message);case Selected():
return selected(_that.theoryModuleId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String message)?  receiveInProgress,TResult? Function( List<TheoryModuleEntity> theoryModules)?  receiveSuccess,TResult? Function( String message)?  receiveFailed,TResult? Function( int theoryModuleId)?  selected,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ReceiveInProgress() when receiveInProgress != null:
return receiveInProgress(_that.message);case ReceiveSuccess() when receiveSuccess != null:
return receiveSuccess(_that.theoryModules);case ReceiveFailed() when receiveFailed != null:
return receiveFailed(_that.message);case Selected() when selected != null:
return selected(_that.theoryModuleId);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TheoryModuleListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TheoryModuleListState.initial()';
}


}




/// @nodoc


class ReceiveInProgress implements TheoryModuleListState {
  const ReceiveInProgress({required this.message});
  

 final  String message;

/// Create a copy of TheoryModuleListState
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
  return 'TheoryModuleListState.receiveInProgress(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveInProgressCopyWith<$Res> implements $TheoryModuleListStateCopyWith<$Res> {
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

/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveInProgress(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReceiveSuccess implements TheoryModuleListState {
  const ReceiveSuccess({required final  List<TheoryModuleEntity> theoryModules}): _theoryModules = theoryModules;
  

 final  List<TheoryModuleEntity> _theoryModules;
 List<TheoryModuleEntity> get theoryModules {
  if (_theoryModules is EqualUnmodifiableListView) return _theoryModules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_theoryModules);
}


/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveSuccessCopyWith<ReceiveSuccess> get copyWith => _$ReceiveSuccessCopyWithImpl<ReceiveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveSuccess&&const DeepCollectionEquality().equals(other._theoryModules, _theoryModules));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_theoryModules));

@override
String toString() {
  return 'TheoryModuleListState.receiveSuccess(theoryModules: $theoryModules)';
}


}

/// @nodoc
abstract mixin class $ReceiveSuccessCopyWith<$Res> implements $TheoryModuleListStateCopyWith<$Res> {
  factory $ReceiveSuccessCopyWith(ReceiveSuccess value, $Res Function(ReceiveSuccess) _then) = _$ReceiveSuccessCopyWithImpl;
@useResult
$Res call({
 List<TheoryModuleEntity> theoryModules
});




}
/// @nodoc
class _$ReceiveSuccessCopyWithImpl<$Res>
    implements $ReceiveSuccessCopyWith<$Res> {
  _$ReceiveSuccessCopyWithImpl(this._self, this._then);

  final ReceiveSuccess _self;
  final $Res Function(ReceiveSuccess) _then;

/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? theoryModules = null,}) {
  return _then(ReceiveSuccess(
theoryModules: null == theoryModules ? _self._theoryModules : theoryModules // ignore: cast_nullable_to_non_nullable
as List<TheoryModuleEntity>,
  ));
}


}

/// @nodoc


class ReceiveFailed implements TheoryModuleListState {
  const ReceiveFailed({required this.message});
  

 final  String message;

/// Create a copy of TheoryModuleListState
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
  return 'TheoryModuleListState.receiveFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReceiveFailedCopyWith<$Res> implements $TheoryModuleListStateCopyWith<$Res> {
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

/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReceiveFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Selected implements TheoryModuleListState {
  const Selected({required this.theoryModuleId});
  

 final  int theoryModuleId;

/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedCopyWith<Selected> get copyWith => _$SelectedCopyWithImpl<Selected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Selected&&(identical(other.theoryModuleId, theoryModuleId) || other.theoryModuleId == theoryModuleId));
}


@override
int get hashCode => Object.hash(runtimeType,theoryModuleId);

@override
String toString() {
  return 'TheoryModuleListState.selected(theoryModuleId: $theoryModuleId)';
}


}

/// @nodoc
abstract mixin class $SelectedCopyWith<$Res> implements $TheoryModuleListStateCopyWith<$Res> {
  factory $SelectedCopyWith(Selected value, $Res Function(Selected) _then) = _$SelectedCopyWithImpl;
@useResult
$Res call({
 int theoryModuleId
});




}
/// @nodoc
class _$SelectedCopyWithImpl<$Res>
    implements $SelectedCopyWith<$Res> {
  _$SelectedCopyWithImpl(this._self, this._then);

  final Selected _self;
  final $Res Function(Selected) _then;

/// Create a copy of TheoryModuleListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? theoryModuleId = null,}) {
  return _then(Selected(
theoryModuleId: null == theoryModuleId ? _self.theoryModuleId : theoryModuleId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TheoryModuleListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TheoryModuleListEvent()';
}


}

/// @nodoc
class $TheoryModuleListEventCopyWith<$Res>  {
$TheoryModuleListEventCopyWith(TheoryModuleListEvent _, $Res Function(TheoryModuleListEvent) __);
}


/// Adds pattern-matching-related methods to [TheoryModuleListEvent].
extension TheoryModuleListEventPatterns on TheoryModuleListEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  receive,TResult Function( int id)?  select,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive();case _Select() when select != null:
return select(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  receive,required TResult Function( int id)  select,}) {final _that = this;
switch (_that) {
case _Receive():
return receive();case _Select():
return select(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  receive,TResult? Function( int id)?  select,}) {final _that = this;
switch (_that) {
case _Receive() when receive != null:
return receive();case _Select() when select != null:
return select(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Receive implements TheoryModuleListEvent {
  const _Receive();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receive);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TheoryModuleListEvent.receive()';
}


}




/// @nodoc


class _Select implements TheoryModuleListEvent {
  const _Select({required this.id});
  

 final  int id;

/// Create a copy of TheoryModuleListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCopyWith<_Select> get copyWith => __$SelectCopyWithImpl<_Select>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Select&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TheoryModuleListEvent.select(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SelectCopyWith<$Res> implements $TheoryModuleListEventCopyWith<$Res> {
  factory _$SelectCopyWith(_Select value, $Res Function(_Select) _then) = __$SelectCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$SelectCopyWithImpl<$Res>
    implements _$SelectCopyWith<$Res> {
  __$SelectCopyWithImpl(this._self, this._then);

  final _Select _self;
  final $Res Function(_Select) _then;

/// Create a copy of TheoryModuleListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Select(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
