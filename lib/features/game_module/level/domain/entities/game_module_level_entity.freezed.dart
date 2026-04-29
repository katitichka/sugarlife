// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_level_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameModuleLevelEntity {

 int get id; String get title; int get orderIndex; int get theoryModuleId; int get totalQuestions;
/// Create a copy of GameModuleLevelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModuleLevelEntityCopyWith<GameModuleLevelEntity> get copyWith => _$GameModuleLevelEntityCopyWithImpl<GameModuleLevelEntity>(this as GameModuleLevelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleLevelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.theoryModuleId, theoryModuleId) || other.theoryModuleId == theoryModuleId)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex,theoryModuleId,totalQuestions);

@override
String toString() {
  return 'GameModuleLevelEntity(id: $id, title: $title, orderIndex: $orderIndex, theoryModuleId: $theoryModuleId, totalQuestions: $totalQuestions)';
}


}

/// @nodoc
abstract mixin class $GameModuleLevelEntityCopyWith<$Res>  {
  factory $GameModuleLevelEntityCopyWith(GameModuleLevelEntity value, $Res Function(GameModuleLevelEntity) _then) = _$GameModuleLevelEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, int orderIndex, int theoryModuleId, int totalQuestions
});




}
/// @nodoc
class _$GameModuleLevelEntityCopyWithImpl<$Res>
    implements $GameModuleLevelEntityCopyWith<$Res> {
  _$GameModuleLevelEntityCopyWithImpl(this._self, this._then);

  final GameModuleLevelEntity _self;
  final $Res Function(GameModuleLevelEntity) _then;

/// Create a copy of GameModuleLevelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,Object? theoryModuleId = null,Object? totalQuestions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,theoryModuleId: null == theoryModuleId ? _self.theoryModuleId : theoryModuleId // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModuleLevelEntity].
extension GameModuleLevelEntityPatterns on GameModuleLevelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModuleLevelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModuleLevelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModuleLevelEntity value)  $default,){
final _that = this;
switch (_that) {
case _GameModuleLevelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModuleLevelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GameModuleLevelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int orderIndex,  int theoryModuleId,  int totalQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModuleLevelEntity() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex,_that.theoryModuleId,_that.totalQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int orderIndex,  int theoryModuleId,  int totalQuestions)  $default,) {final _that = this;
switch (_that) {
case _GameModuleLevelEntity():
return $default(_that.id,_that.title,_that.orderIndex,_that.theoryModuleId,_that.totalQuestions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int orderIndex,  int theoryModuleId,  int totalQuestions)?  $default,) {final _that = this;
switch (_that) {
case _GameModuleLevelEntity() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex,_that.theoryModuleId,_that.totalQuestions);case _:
  return null;

}
}

}

/// @nodoc


class _GameModuleLevelEntity implements GameModuleLevelEntity {
  const _GameModuleLevelEntity({required this.id, required this.title, required this.orderIndex, required this.theoryModuleId, required this.totalQuestions});
  

@override final  int id;
@override final  String title;
@override final  int orderIndex;
@override final  int theoryModuleId;
@override final  int totalQuestions;

/// Create a copy of GameModuleLevelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModuleLevelEntityCopyWith<_GameModuleLevelEntity> get copyWith => __$GameModuleLevelEntityCopyWithImpl<_GameModuleLevelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModuleLevelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.theoryModuleId, theoryModuleId) || other.theoryModuleId == theoryModuleId)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex,theoryModuleId,totalQuestions);

@override
String toString() {
  return 'GameModuleLevelEntity(id: $id, title: $title, orderIndex: $orderIndex, theoryModuleId: $theoryModuleId, totalQuestions: $totalQuestions)';
}


}

/// @nodoc
abstract mixin class _$GameModuleLevelEntityCopyWith<$Res> implements $GameModuleLevelEntityCopyWith<$Res> {
  factory _$GameModuleLevelEntityCopyWith(_GameModuleLevelEntity value, $Res Function(_GameModuleLevelEntity) _then) = __$GameModuleLevelEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int orderIndex, int theoryModuleId, int totalQuestions
});




}
/// @nodoc
class __$GameModuleLevelEntityCopyWithImpl<$Res>
    implements _$GameModuleLevelEntityCopyWith<$Res> {
  __$GameModuleLevelEntityCopyWithImpl(this._self, this._then);

  final _GameModuleLevelEntity _self;
  final $Res Function(_GameModuleLevelEntity) _then;

/// Create a copy of GameModuleLevelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,Object? theoryModuleId = null,Object? totalQuestions = null,}) {
  return _then(_GameModuleLevelEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,theoryModuleId: null == theoryModuleId ? _self.theoryModuleId : theoryModuleId // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
