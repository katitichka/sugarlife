// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvatarEntity {

 int get id; String get imageUrl;
/// Create a copy of AvatarEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarEntityCopyWith<AvatarEntity> get copyWith => _$AvatarEntityCopyWithImpl<AvatarEntity>(this as AvatarEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl);

@override
String toString() {
  return 'AvatarEntity(id: $id, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $AvatarEntityCopyWith<$Res>  {
  factory $AvatarEntityCopyWith(AvatarEntity value, $Res Function(AvatarEntity) _then) = _$AvatarEntityCopyWithImpl;
@useResult
$Res call({
 int id, String imageUrl
});




}
/// @nodoc
class _$AvatarEntityCopyWithImpl<$Res>
    implements $AvatarEntityCopyWith<$Res> {
  _$AvatarEntityCopyWithImpl(this._self, this._then);

  final AvatarEntity _self;
  final $Res Function(AvatarEntity) _then;

/// Create a copy of AvatarEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarEntity].
extension AvatarEntityPatterns on AvatarEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarEntity value)  $default,){
final _that = this;
switch (_that) {
case _AvatarEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarEntity() when $default != null:
return $default(_that.id,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _AvatarEntity():
return $default(_that.id,_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _AvatarEntity() when $default != null:
return $default(_that.id,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AvatarEntity implements AvatarEntity {
  const _AvatarEntity({required this.id, required this.imageUrl});
  

@override final  int id;
@override final  String imageUrl;

/// Create a copy of AvatarEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarEntityCopyWith<_AvatarEntity> get copyWith => __$AvatarEntityCopyWithImpl<_AvatarEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageUrl);

@override
String toString() {
  return 'AvatarEntity(id: $id, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$AvatarEntityCopyWith<$Res> implements $AvatarEntityCopyWith<$Res> {
  factory _$AvatarEntityCopyWith(_AvatarEntity value, $Res Function(_AvatarEntity) _then) = __$AvatarEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String imageUrl
});




}
/// @nodoc
class __$AvatarEntityCopyWithImpl<$Res>
    implements _$AvatarEntityCopyWith<$Res> {
  __$AvatarEntityCopyWithImpl(this._self, this._then);

  final _AvatarEntity _self;
  final $Res Function(_AvatarEntity) _then;

/// Create a copy of AvatarEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,}) {
  return _then(_AvatarEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
