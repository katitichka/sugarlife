// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameModuleListEntity {

 int get id; String get title; int get orderIndex;
/// Create a copy of GameModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModuleListEntityCopyWith<GameModuleListEntity> get copyWith => _$GameModuleListEntityCopyWithImpl<GameModuleListEntity>(this as GameModuleListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex);

@override
String toString() {
  return 'GameModuleListEntity(id: $id, title: $title, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $GameModuleListEntityCopyWith<$Res>  {
  factory $GameModuleListEntityCopyWith(GameModuleListEntity value, $Res Function(GameModuleListEntity) _then) = _$GameModuleListEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, int orderIndex
});




}
/// @nodoc
class _$GameModuleListEntityCopyWithImpl<$Res>
    implements $GameModuleListEntityCopyWith<$Res> {
  _$GameModuleListEntityCopyWithImpl(this._self, this._then);

  final GameModuleListEntity _self;
  final $Res Function(GameModuleListEntity) _then;

/// Create a copy of GameModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameModuleListEntity].
extension GameModuleListEntityPatterns on GameModuleListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModuleListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModuleListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModuleListEntity value)  $default,){
final _that = this;
switch (_that) {
case _GameModuleListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModuleListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GameModuleListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModuleListEntity() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int orderIndex)  $default,) {final _that = this;
switch (_that) {
case _GameModuleListEntity():
return $default(_that.id,_that.title,_that.orderIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _GameModuleListEntity() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc


class _GameModuleListEntity implements GameModuleListEntity {
  const _GameModuleListEntity({required this.id, required this.title, required this.orderIndex});
  

@override final  int id;
@override final  String title;
@override final  int orderIndex;

/// Create a copy of GameModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModuleListEntityCopyWith<_GameModuleListEntity> get copyWith => __$GameModuleListEntityCopyWithImpl<_GameModuleListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModuleListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex);

@override
String toString() {
  return 'GameModuleListEntity(id: $id, title: $title, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$GameModuleListEntityCopyWith<$Res> implements $GameModuleListEntityCopyWith<$Res> {
  factory _$GameModuleListEntityCopyWith(_GameModuleListEntity value, $Res Function(_GameModuleListEntity) _then) = __$GameModuleListEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int orderIndex
});




}
/// @nodoc
class __$GameModuleListEntityCopyWithImpl<$Res>
    implements _$GameModuleListEntityCopyWith<$Res> {
  __$GameModuleListEntityCopyWithImpl(this._self, this._then);

  final _GameModuleListEntity _self;
  final $Res Function(_GameModuleListEntity) _then;

/// Create a copy of GameModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,}) {
  return _then(_GameModuleListEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
