// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvatarDto {

 int get id;@JsonKey(name: 'image_url') String get imageUrl;
/// Create a copy of AvatarDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarDtoCopyWith<AvatarDto> get copyWith => _$AvatarDtoCopyWithImpl<AvatarDto>(this as AvatarDto, _$identity);

  /// Serializes this AvatarDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl);

@override
String toString() {
  return 'AvatarDto(id: $id, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $AvatarDtoCopyWith<$Res>  {
  factory $AvatarDtoCopyWith(AvatarDto value, $Res Function(AvatarDto) _then) = _$AvatarDtoCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class _$AvatarDtoCopyWithImpl<$Res>
    implements $AvatarDtoCopyWith<$Res> {
  _$AvatarDtoCopyWithImpl(this._self, this._then);

  final AvatarDto _self;
  final $Res Function(AvatarDto) _then;

/// Create a copy of AvatarDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarDto].
extension AvatarDtoPatterns on AvatarDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarDto value)  $default,){
final _that = this;
switch (_that) {
case _AvatarDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'image_url')  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'image_url')  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _AvatarDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'image_url')  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _AvatarDto() when $default != null:
return $default(_that.id,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvatarDto implements AvatarDto {
  const _AvatarDto({required this.id, @JsonKey(name: 'image_url') required this.imageUrl});
  factory _AvatarDto.fromJson(Map<String, dynamic> json) => _$AvatarDtoFromJson(json);

@override final  int id;
@override@JsonKey(name: 'image_url') final  String imageUrl;

/// Create a copy of AvatarDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarDtoCopyWith<_AvatarDto> get copyWith => __$AvatarDtoCopyWithImpl<_AvatarDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvatarDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl);

@override
String toString() {
  return 'AvatarDto(id: $id, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$AvatarDtoCopyWith<$Res> implements $AvatarDtoCopyWith<$Res> {
  factory _$AvatarDtoCopyWith(_AvatarDto value, $Res Function(_AvatarDto) _then) = __$AvatarDtoCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'image_url') String imageUrl
});




}
/// @nodoc
class __$AvatarDtoCopyWithImpl<$Res>
    implements _$AvatarDtoCopyWith<$Res> {
  __$AvatarDtoCopyWithImpl(this._self, this._then);

  final _AvatarDto _self;
  final $Res Function(_AvatarDto) _then;

/// Create a copy of AvatarDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,}) {
  return _then(_AvatarDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
