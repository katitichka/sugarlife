// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterEntity {

 int get id; String get imageUrl; String get name;
/// Create a copy of CharacterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterEntityCopyWith<CharacterEntity> get copyWith => _$CharacterEntityCopyWithImpl<CharacterEntity>(this as CharacterEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,name);

@override
String toString() {
  return 'CharacterEntity(id: $id, imageUrl: $imageUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class $CharacterEntityCopyWith<$Res>  {
  factory $CharacterEntityCopyWith(CharacterEntity value, $Res Function(CharacterEntity) _then) = _$CharacterEntityCopyWithImpl;
@useResult
$Res call({
 int id, String imageUrl, String name
});




}
/// @nodoc
class _$CharacterEntityCopyWithImpl<$Res>
    implements $CharacterEntityCopyWith<$Res> {
  _$CharacterEntityCopyWithImpl(this._self, this._then);

  final CharacterEntity _self;
  final $Res Function(CharacterEntity) _then;

/// Create a copy of CharacterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterEntity].
extension CharacterEntityPatterns on CharacterEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterEntity value)  $default,){
final _that = this;
switch (_that) {
case _CharacterEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String imageUrl,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String imageUrl,  String name)  $default,) {final _that = this;
switch (_that) {
case _CharacterEntity():
return $default(_that.id,_that.imageUrl,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String imageUrl,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CharacterEntity() when $default != null:
return $default(_that.id,_that.imageUrl,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterEntity implements CharacterEntity {
  const _CharacterEntity({required this.id, required this.imageUrl, required this.name});
  

@override final  int id;
@override final  String imageUrl;
@override final  String name;

/// Create a copy of CharacterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterEntityCopyWith<_CharacterEntity> get copyWith => __$CharacterEntityCopyWithImpl<_CharacterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,name);

@override
String toString() {
  return 'CharacterEntity(id: $id, imageUrl: $imageUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CharacterEntityCopyWith<$Res> implements $CharacterEntityCopyWith<$Res> {
  factory _$CharacterEntityCopyWith(_CharacterEntity value, $Res Function(_CharacterEntity) _then) = __$CharacterEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String imageUrl, String name
});




}
/// @nodoc
class __$CharacterEntityCopyWithImpl<$Res>
    implements _$CharacterEntityCopyWith<$Res> {
  __$CharacterEntityCopyWithImpl(this._self, this._then);

  final _CharacterEntity _self;
  final $Res Function(_CharacterEntity) _then;

/// Create a copy of CharacterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? name = null,}) {
  return _then(_CharacterEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
