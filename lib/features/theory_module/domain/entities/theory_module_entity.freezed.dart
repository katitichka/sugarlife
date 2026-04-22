// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theory_module_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TheoryModuleEntity {

 int get id; String get title; String get subtitle; int get characterId; Color get color; int get orderIndex; String get characterImageUrl; String? get content;
/// Create a copy of TheoryModuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheoryModuleEntityCopyWith<TheoryModuleEntity> get copyWith => _$TheoryModuleEntityCopyWithImpl<TheoryModuleEntity>(this as TheoryModuleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.color, color) || other.color == color)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterId,color,orderIndex,characterImageUrl,content);

@override
String toString() {
  return 'TheoryModuleEntity(id: $id, title: $title, subtitle: $subtitle, characterId: $characterId, color: $color, orderIndex: $orderIndex, characterImageUrl: $characterImageUrl, content: $content)';
}


}

/// @nodoc
abstract mixin class $TheoryModuleEntityCopyWith<$Res>  {
  factory $TheoryModuleEntityCopyWith(TheoryModuleEntity value, $Res Function(TheoryModuleEntity) _then) = _$TheoryModuleEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle, int characterId, Color color, int orderIndex, String characterImageUrl, String? content
});




}
/// @nodoc
class _$TheoryModuleEntityCopyWithImpl<$Res>
    implements $TheoryModuleEntityCopyWith<$Res> {
  _$TheoryModuleEntityCopyWithImpl(this._self, this._then);

  final TheoryModuleEntity _self;
  final $Res Function(TheoryModuleEntity) _then;

/// Create a copy of TheoryModuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterId = null,Object? color = null,Object? orderIndex = null,Object? characterImageUrl = null,Object? content = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TheoryModuleEntity].
extension TheoryModuleEntityPatterns on TheoryModuleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TheoryModuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TheoryModuleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TheoryModuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TheoryModuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  int characterId,  Color color,  int orderIndex,  String characterImageUrl,  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TheoryModuleEntity() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.color,_that.orderIndex,_that.characterImageUrl,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle,  int characterId,  Color color,  int orderIndex,  String characterImageUrl,  String? content)  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleEntity():
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.color,_that.orderIndex,_that.characterImageUrl,_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle,  int characterId,  Color color,  int orderIndex,  String characterImageUrl,  String? content)?  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleEntity() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.color,_that.orderIndex,_that.characterImageUrl,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _TheoryModuleEntity implements TheoryModuleEntity {
  const _TheoryModuleEntity({required this.id, required this.title, required this.subtitle, required this.characterId, required this.color, required this.orderIndex, required this.characterImageUrl, this.content});
  

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override final  int characterId;
@override final  Color color;
@override final  int orderIndex;
@override final  String characterImageUrl;
@override final  String? content;

/// Create a copy of TheoryModuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheoryModuleEntityCopyWith<_TheoryModuleEntity> get copyWith => __$TheoryModuleEntityCopyWithImpl<_TheoryModuleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheoryModuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.color, color) || other.color == color)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterId,color,orderIndex,characterImageUrl,content);

@override
String toString() {
  return 'TheoryModuleEntity(id: $id, title: $title, subtitle: $subtitle, characterId: $characterId, color: $color, orderIndex: $orderIndex, characterImageUrl: $characterImageUrl, content: $content)';
}


}

/// @nodoc
abstract mixin class _$TheoryModuleEntityCopyWith<$Res> implements $TheoryModuleEntityCopyWith<$Res> {
  factory _$TheoryModuleEntityCopyWith(_TheoryModuleEntity value, $Res Function(_TheoryModuleEntity) _then) = __$TheoryModuleEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle, int characterId, Color color, int orderIndex, String characterImageUrl, String? content
});




}
/// @nodoc
class __$TheoryModuleEntityCopyWithImpl<$Res>
    implements _$TheoryModuleEntityCopyWith<$Res> {
  __$TheoryModuleEntityCopyWithImpl(this._self, this._then);

  final _TheoryModuleEntity _self;
  final $Res Function(_TheoryModuleEntity) _then;

/// Create a copy of TheoryModuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterId = null,Object? color = null,Object? orderIndex = null,Object? characterImageUrl = null,Object? content = freezed,}) {
  return _then(_TheoryModuleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
