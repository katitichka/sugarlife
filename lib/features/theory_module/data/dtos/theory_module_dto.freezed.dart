// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theory_module_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TheoryModuleDto {

 int get id; String get title; String get subtitle;@JsonKey(name: 'character_id') int get characterId;@JsonKey(name: 'color_hex') String get colorHex;@JsonKey(name: 'order_index') int get orderIndex;@JsonKey(name: 'character_image_url') String get characterImageUrl; Map<String, dynamic> get content;
/// Create a copy of TheoryModuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheoryModuleDtoCopyWith<TheoryModuleDto> get copyWith => _$TheoryModuleDtoCopyWithImpl<TheoryModuleDto>(this as TheoryModuleDto, _$identity);

  /// Serializes this TheoryModuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterId,colorHex,orderIndex,characterImageUrl,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'TheoryModuleDto(id: $id, title: $title, subtitle: $subtitle, characterId: $characterId, colorHex: $colorHex, orderIndex: $orderIndex, characterImageUrl: $characterImageUrl, content: $content)';
}


}

/// @nodoc
abstract mixin class $TheoryModuleDtoCopyWith<$Res>  {
  factory $TheoryModuleDtoCopyWith(TheoryModuleDto value, $Res Function(TheoryModuleDto) _then) = _$TheoryModuleDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle,@JsonKey(name: 'character_id') int characterId,@JsonKey(name: 'color_hex') String colorHex,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'character_image_url') String characterImageUrl, Map<String, dynamic> content
});




}
/// @nodoc
class _$TheoryModuleDtoCopyWithImpl<$Res>
    implements $TheoryModuleDtoCopyWith<$Res> {
  _$TheoryModuleDtoCopyWithImpl(this._self, this._then);

  final TheoryModuleDto _self;
  final $Res Function(TheoryModuleDto) _then;

/// Create a copy of TheoryModuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterId = null,Object? colorHex = null,Object? orderIndex = null,Object? characterImageUrl = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [TheoryModuleDto].
extension TheoryModuleDtoPatterns on TheoryModuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TheoryModuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TheoryModuleDto value)  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TheoryModuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle, @JsonKey(name: 'character_id')  int characterId, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'character_image_url')  String characterImageUrl,  Map<String, dynamic> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.colorHex,_that.orderIndex,_that.characterImageUrl,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle, @JsonKey(name: 'character_id')  int characterId, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'character_image_url')  String characterImageUrl,  Map<String, dynamic> content)  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleDto():
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.colorHex,_that.orderIndex,_that.characterImageUrl,_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle, @JsonKey(name: 'character_id')  int characterId, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'character_image_url')  String characterImageUrl,  Map<String, dynamic> content)?  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.characterId,_that.colorHex,_that.orderIndex,_that.characterImageUrl,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TheoryModuleDto implements TheoryModuleDto {
  const _TheoryModuleDto({required this.id, required this.title, required this.subtitle, @JsonKey(name: 'character_id') required this.characterId, @JsonKey(name: 'color_hex') required this.colorHex, @JsonKey(name: 'order_index') required this.orderIndex, @JsonKey(name: 'character_image_url') required this.characterImageUrl, required final  Map<String, dynamic> content}): _content = content;
  factory _TheoryModuleDto.fromJson(Map<String, dynamic> json) => _$TheoryModuleDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override@JsonKey(name: 'character_id') final  int characterId;
@override@JsonKey(name: 'color_hex') final  String colorHex;
@override@JsonKey(name: 'order_index') final  int orderIndex;
@override@JsonKey(name: 'character_image_url') final  String characterImageUrl;
 final  Map<String, dynamic> _content;
@override Map<String, dynamic> get content {
  if (_content is EqualUnmodifiableMapView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_content);
}


/// Create a copy of TheoryModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheoryModuleDtoCopyWith<_TheoryModuleDto> get copyWith => __$TheoryModuleDtoCopyWithImpl<_TheoryModuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TheoryModuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheoryModuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.characterId, characterId) || other.characterId == characterId)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.characterImageUrl, characterImageUrl) || other.characterImageUrl == characterImageUrl)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,characterId,colorHex,orderIndex,characterImageUrl,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'TheoryModuleDto(id: $id, title: $title, subtitle: $subtitle, characterId: $characterId, colorHex: $colorHex, orderIndex: $orderIndex, characterImageUrl: $characterImageUrl, content: $content)';
}


}

/// @nodoc
abstract mixin class _$TheoryModuleDtoCopyWith<$Res> implements $TheoryModuleDtoCopyWith<$Res> {
  factory _$TheoryModuleDtoCopyWith(_TheoryModuleDto value, $Res Function(_TheoryModuleDto) _then) = __$TheoryModuleDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle,@JsonKey(name: 'character_id') int characterId,@JsonKey(name: 'color_hex') String colorHex,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'character_image_url') String characterImageUrl, Map<String, dynamic> content
});




}
/// @nodoc
class __$TheoryModuleDtoCopyWithImpl<$Res>
    implements _$TheoryModuleDtoCopyWith<$Res> {
  __$TheoryModuleDtoCopyWithImpl(this._self, this._then);

  final _TheoryModuleDto _self;
  final $Res Function(_TheoryModuleDto) _then;

/// Create a copy of TheoryModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? characterId = null,Object? colorHex = null,Object? orderIndex = null,Object? characterImageUrl = null,Object? content = null,}) {
  return _then(_TheoryModuleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,characterId: null == characterId ? _self.characterId : characterId // ignore: cast_nullable_to_non_nullable
as int,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,characterImageUrl: null == characterImageUrl ? _self.characterImageUrl : characterImageUrl // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
