// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theory_module_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TheoryModuleListEntity {

 int get id; String get title; String get subtitle; String get characterImageUrl; Color get color;
/// Create a copy of TheoryModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheoryModuleListEntityCopyWith<TheoryModuleListEntity> get copyWith => _$TheoryModuleListEntityCopyWithImpl<TheoryModuleListEntity>(this as TheoryModuleListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterImageUrl,color);

@override
String toString() {
  return 'TheoryModuleListEntity(id: $id, title: $title, subtitle: $subtitle, characterImageUrl: $characterImageUrl, color: $color)';
}


}

/// @nodoc
abstract mixin class $TheoryModuleListEntityCopyWith<$Res>  {
  factory $TheoryModuleListEntityCopyWith(TheoryModuleListEntity value, $Res Function(TheoryModuleListEntity) _then) = _$TheoryModuleListEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle, String characterImageUrl, Color color
});




}
/// @nodoc
class _$TheoryModuleListEntityCopyWithImpl<$Res>
    implements $TheoryModuleListEntityCopyWith<$Res> {
  _$TheoryModuleListEntityCopyWithImpl(this._self, this._then);

  final TheoryModuleListEntity _self;
  final $Res Function(TheoryModuleListEntity) _then;

/// Create a copy of TheoryModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterImageUrl = null,Object? color = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [TheoryModuleListEntity].
extension TheoryModuleListEntityPatterns on TheoryModuleListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TheoryModuleListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TheoryModuleListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TheoryModuleListEntity value)  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TheoryModuleListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  String characterImageUrl,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TheoryModuleListEntity() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterImageUrl,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  String characterImageUrl,  Color color)  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleListEntity():
return $default(_that.id,_that.title,_that.subtitle,_that.characterImageUrl,_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle,  String characterImageUrl,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleListEntity() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterImageUrl,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _TheoryModuleListEntity implements TheoryModuleListEntity {
  const _TheoryModuleListEntity({required this.id, required this.title, required this.subtitle, required this.characterImageUrl, required this.color});
  

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override final  String characterImageUrl;
@override final  Color color;

/// Create a copy of TheoryModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheoryModuleListEntityCopyWith<_TheoryModuleListEntity> get copyWith => __$TheoryModuleListEntityCopyWithImpl<_TheoryModuleListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheoryModuleListEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterImageUrl,color);

@override
String toString() {
  return 'TheoryModuleListEntity(id: $id, title: $title, subtitle: $subtitle, characterImageUrl: $characterImageUrl, color: $color)';
}


}

/// @nodoc
abstract mixin class _$TheoryModuleListEntityCopyWith<$Res> implements $TheoryModuleListEntityCopyWith<$Res> {
  factory _$TheoryModuleListEntityCopyWith(_TheoryModuleListEntity value, $Res Function(_TheoryModuleListEntity) _then) = __$TheoryModuleListEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle, String characterImageUrl, Color color
});




}
/// @nodoc
class __$TheoryModuleListEntityCopyWithImpl<$Res>
    implements _$TheoryModuleListEntityCopyWith<$Res> {
  __$TheoryModuleListEntityCopyWithImpl(this._self, this._then);

  final _TheoryModuleListEntity _self;
  final $Res Function(_TheoryModuleListEntity) _then;

/// Create a copy of TheoryModuleListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterImageUrl = null,Object? color = null,}) {
  return _then(_TheoryModuleListEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
