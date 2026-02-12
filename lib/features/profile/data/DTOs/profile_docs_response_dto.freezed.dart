// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_docs_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDocsResponseDto {

 String get id; String get name; int get age; String get gender;
/// Create a copy of ProfileDocsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDocsResponseDtoCopyWith<ProfileDocsResponseDto> get copyWith => _$ProfileDocsResponseDtoCopyWithImpl<ProfileDocsResponseDto>(this as ProfileDocsResponseDto, _$identity);

  /// Serializes this ProfileDocsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDocsResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,age,gender);

@override
String toString() {
  return 'ProfileDocsResponseDto(id: $id, name: $name, age: $age, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $ProfileDocsResponseDtoCopyWith<$Res>  {
  factory $ProfileDocsResponseDtoCopyWith(ProfileDocsResponseDto value, $Res Function(ProfileDocsResponseDto) _then) = _$ProfileDocsResponseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, int age, String gender
});




}
/// @nodoc
class _$ProfileDocsResponseDtoCopyWithImpl<$Res>
    implements $ProfileDocsResponseDtoCopyWith<$Res> {
  _$ProfileDocsResponseDtoCopyWithImpl(this._self, this._then);

  final ProfileDocsResponseDto _self;
  final $Res Function(ProfileDocsResponseDto) _then;

/// Create a copy of ProfileDocsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? age = null,Object? gender = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDocsResponseDto].
extension ProfileDocsResponseDtoPatterns on ProfileDocsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDocsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDocsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDocsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDocsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDocsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDocsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int age,  String gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDocsResponseDto() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int age,  String gender)  $default,) {final _that = this;
switch (_that) {
case _ProfileDocsResponseDto():
return $default(_that.id,_that.name,_that.age,_that.gender);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int age,  String gender)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDocsResponseDto() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDocsResponseDto implements ProfileDocsResponseDto {
  const _ProfileDocsResponseDto({required this.id, required this.name, required this.age, required this.gender});
  factory _ProfileDocsResponseDto.fromJson(Map<String, dynamic> json) => _$ProfileDocsResponseDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  int age;
@override final  String gender;

/// Create a copy of ProfileDocsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDocsResponseDtoCopyWith<_ProfileDocsResponseDto> get copyWith => __$ProfileDocsResponseDtoCopyWithImpl<_ProfileDocsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDocsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDocsResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,age,gender);

@override
String toString() {
  return 'ProfileDocsResponseDto(id: $id, name: $name, age: $age, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$ProfileDocsResponseDtoCopyWith<$Res> implements $ProfileDocsResponseDtoCopyWith<$Res> {
  factory _$ProfileDocsResponseDtoCopyWith(_ProfileDocsResponseDto value, $Res Function(_ProfileDocsResponseDto) _then) = __$ProfileDocsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int age, String gender
});




}
/// @nodoc
class __$ProfileDocsResponseDtoCopyWithImpl<$Res>
    implements _$ProfileDocsResponseDtoCopyWith<$Res> {
  __$ProfileDocsResponseDtoCopyWithImpl(this._self, this._then);

  final _ProfileDocsResponseDto _self;
  final $Res Function(_ProfileDocsResponseDto) _then;

/// Create a copy of ProfileDocsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? age = null,Object? gender = null,}) {
  return _then(_ProfileDocsResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
