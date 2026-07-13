// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AchievementEntity {

 int get id; String get name; String get description; String get imageUrl; AchievementType get type;
/// Create a copy of AchievementEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementEntityCopyWith<AchievementEntity> get copyWith => _$AchievementEntityCopyWithImpl<AchievementEntity>(this as AchievementEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,type);

@override
String toString() {
  return 'AchievementEntity(id: $id, name: $name, description: $description, imageUrl: $imageUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class $AchievementEntityCopyWith<$Res>  {
  factory $AchievementEntityCopyWith(AchievementEntity value, $Res Function(AchievementEntity) _then) = _$AchievementEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String imageUrl, AchievementType type
});




}
/// @nodoc
class _$AchievementEntityCopyWithImpl<$Res>
    implements $AchievementEntityCopyWith<$Res> {
  _$AchievementEntityCopyWithImpl(this._self, this._then);

  final AchievementEntity _self;
  final $Res Function(AchievementEntity) _then;

/// Create a copy of AchievementEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AchievementType,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementEntity].
extension AchievementEntityPatterns on AchievementEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementEntity value)  $default,){
final _that = this;
switch (_that) {
case _AchievementEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String imageUrl,  AchievementType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String imageUrl,  AchievementType type)  $default,) {final _that = this;
switch (_that) {
case _AchievementEntity():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String imageUrl,  AchievementType type)?  $default,) {final _that = this;
switch (_that) {
case _AchievementEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _AchievementEntity implements AchievementEntity {
  const _AchievementEntity({required this.id, required this.name, required this.description, required this.imageUrl, required this.type});
  

@override final  int id;
@override final  String name;
@override final  String description;
@override final  String imageUrl;
@override final  AchievementType type;

/// Create a copy of AchievementEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementEntityCopyWith<_AchievementEntity> get copyWith => __$AchievementEntityCopyWithImpl<_AchievementEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,type);

@override
String toString() {
  return 'AchievementEntity(id: $id, name: $name, description: $description, imageUrl: $imageUrl, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AchievementEntityCopyWith<$Res> implements $AchievementEntityCopyWith<$Res> {
  factory _$AchievementEntityCopyWith(_AchievementEntity value, $Res Function(_AchievementEntity) _then) = __$AchievementEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String imageUrl, AchievementType type
});




}
/// @nodoc
class __$AchievementEntityCopyWithImpl<$Res>
    implements _$AchievementEntityCopyWith<$Res> {
  __$AchievementEntityCopyWithImpl(this._self, this._then);

  final _AchievementEntity _self;
  final $Res Function(_AchievementEntity) _then;

/// Create a copy of AchievementEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? type = null,}) {
  return _then(_AchievementEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AchievementType,
  ));
}


}

// dart format on
