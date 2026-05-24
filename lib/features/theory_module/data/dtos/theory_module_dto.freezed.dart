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

 int get id; String get title; String get subtitle;@JsonKey(name: 'color_hex') String get colorHex;@JsonKey(name: 'order_index') int get orderIndex;
/// Create a copy of TheoryModuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheoryModuleDtoCopyWith<TheoryModuleDto> get copyWith => _$TheoryModuleDtoCopyWithImpl<TheoryModuleDto>(this as TheoryModuleDto, _$identity);

  /// Serializes this TheoryModuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheoryModuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,colorHex,orderIndex);

@override
String toString() {
  return 'TheoryModuleDto(id: $id, title: $title, subtitle: $subtitle, colorHex: $colorHex, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $TheoryModuleDtoCopyWith<$Res>  {
  factory $TheoryModuleDtoCopyWith(TheoryModuleDto value, $Res Function(TheoryModuleDto) _then) = _$TheoryModuleDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String subtitle,@JsonKey(name: 'color_hex') String colorHex,@JsonKey(name: 'order_index') int orderIndex
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? colorHex = null,Object? orderIndex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.colorHex,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String subtitle, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex)  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleDto():
return $default(_that.id,_that.title,_that.subtitle,_that.colorHex,_that.orderIndex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String subtitle, @JsonKey(name: 'color_hex')  String colorHex, @JsonKey(name: 'order_index')  int orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _TheoryModuleDto() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.colorHex,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TheoryModuleDto implements TheoryModuleDto {
  const _TheoryModuleDto({required this.id, required this.title, required this.subtitle, @JsonKey(name: 'color_hex') required this.colorHex, @JsonKey(name: 'order_index') required this.orderIndex});
  factory _TheoryModuleDto.fromJson(Map<String, dynamic> json) => _$TheoryModuleDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String subtitle;
@override@JsonKey(name: 'color_hex') final  String colorHex;
@override@JsonKey(name: 'order_index') final  int orderIndex;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheoryModuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,colorHex,orderIndex);

@override
String toString() {
  return 'TheoryModuleDto(id: $id, title: $title, subtitle: $subtitle, colorHex: $colorHex, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$TheoryModuleDtoCopyWith<$Res> implements $TheoryModuleDtoCopyWith<$Res> {
  factory _$TheoryModuleDtoCopyWith(_TheoryModuleDto value, $Res Function(_TheoryModuleDto) _then) = __$TheoryModuleDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String subtitle,@JsonKey(name: 'color_hex') String colorHex,@JsonKey(name: 'order_index') int orderIndex
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? colorHex = null,Object? orderIndex = null,}) {
  return _then(_TheoryModuleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
