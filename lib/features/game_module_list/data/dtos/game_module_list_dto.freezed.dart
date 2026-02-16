// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameModuleListDto {

 int get id; String get title;@JsonKey(name: 'order_index') int get orderIndex;
/// Create a copy of GameModuleListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameModuleListDtoCopyWith<GameModuleListDto> get copyWith => _$GameModuleListDtoCopyWithImpl<GameModuleListDto>(this as GameModuleListDto, _$identity);

  /// Serializes this GameModuleListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameModuleListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex);

@override
String toString() {
  return 'GameModuleListDto(id: $id, title: $title, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $GameModuleListDtoCopyWith<$Res>  {
  factory $GameModuleListDtoCopyWith(GameModuleListDto value, $Res Function(GameModuleListDto) _then) = _$GameModuleListDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'order_index') int orderIndex
});




}
/// @nodoc
class _$GameModuleListDtoCopyWithImpl<$Res>
    implements $GameModuleListDtoCopyWith<$Res> {
  _$GameModuleListDtoCopyWithImpl(this._self, this._then);

  final GameModuleListDto _self;
  final $Res Function(GameModuleListDto) _then;

/// Create a copy of GameModuleListDto
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


/// Adds pattern-matching-related methods to [GameModuleListDto].
extension GameModuleListDtoPatterns on GameModuleListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameModuleListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameModuleListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameModuleListDto value)  $default,){
final _that = this;
switch (_that) {
case _GameModuleListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameModuleListDto value)?  $default,){
final _that = this;
switch (_that) {
case _GameModuleListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameModuleListDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex)  $default,) {final _that = this;
switch (_that) {
case _GameModuleListDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _GameModuleListDto() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameModuleListDto implements GameModuleListDto {
  const _GameModuleListDto({required this.id, required this.title, @JsonKey(name: 'order_index') required this.orderIndex});
  factory _GameModuleListDto.fromJson(Map<String, dynamic> json) => _$GameModuleListDtoFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'order_index') final  int orderIndex;

/// Create a copy of GameModuleListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameModuleListDtoCopyWith<_GameModuleListDto> get copyWith => __$GameModuleListDtoCopyWithImpl<_GameModuleListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameModuleListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameModuleListDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,orderIndex);

@override
String toString() {
  return 'GameModuleListDto(id: $id, title: $title, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$GameModuleListDtoCopyWith<$Res> implements $GameModuleListDtoCopyWith<$Res> {
  factory _$GameModuleListDtoCopyWith(_GameModuleListDto value, $Res Function(_GameModuleListDto) _then) = __$GameModuleListDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'order_index') int orderIndex
});




}
/// @nodoc
class __$GameModuleListDtoCopyWithImpl<$Res>
    implements _$GameModuleListDtoCopyWith<$Res> {
  __$GameModuleListDtoCopyWithImpl(this._self, this._then);

  final _GameModuleListDto _self;
  final $Res Function(_GameModuleListDto) _then;

/// Create a copy of GameModuleListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,}) {
  return _then(_GameModuleListDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
