// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_module_level_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameModuleLevelDto {
  int get id;
  String get title;
  @JsonKey(name: 'order_index')
  int get orderIndex;

  /// Create a copy of GameModuleLevelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GameModuleLevelDtoCopyWith<GameModuleLevelDto> get copyWith =>
      _$GameModuleLevelDtoCopyWithImpl<GameModuleLevelDto>(
          this as GameModuleLevelDto, _$identity);

  /// Serializes this GameModuleLevelDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameModuleLevelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, orderIndex);

  @override
  String toString() {
    return 'GameModuleLevelDto(id: $id, title: $title, orderIndex: $orderIndex)';
  }
}

/// @nodoc
abstract mixin class $GameModuleLevelDtoCopyWith<$Res> {
  factory $GameModuleLevelDtoCopyWith(
          GameModuleLevelDto value, $Res Function(GameModuleLevelDto) _then) =
      _$GameModuleLevelDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id, String title, @JsonKey(name: 'order_index') int orderIndex});
}

/// @nodoc
class _$GameModuleLevelDtoCopyWithImpl<$Res>
    implements $GameModuleLevelDtoCopyWith<$Res> {
  _$GameModuleLevelDtoCopyWithImpl(this._self, this._then);

  final GameModuleLevelDto _self;
  final $Res Function(GameModuleLevelDto) _then;

  /// Create a copy of GameModuleLevelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? orderIndex = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _self.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [GameModuleLevelDto].
extension GameModuleLevelDtoPatterns on GameModuleLevelDto {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GameModuleLevelDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GameModuleLevelDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto():
        return $default(_that);
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GameModuleLevelDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id, String title, @JsonKey(name: 'order_index') int orderIndex)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto() when $default != null:
        return $default(_that.id, _that.title, _that.orderIndex);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id, String title, @JsonKey(name: 'order_index') int orderIndex)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto():
        return $default(_that.id, _that.title, _that.orderIndex);
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id, String title, @JsonKey(name: 'order_index') int orderIndex)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GameModuleLevelDto() when $default != null:
        return $default(_that.id, _that.title, _that.orderIndex);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GameModuleLevelDto implements GameModuleLevelDto {
  const _GameModuleLevelDto(
      {required this.id,
      required this.title,
      @JsonKey(name: 'order_index') required this.orderIndex});
  factory _GameModuleLevelDto.fromJson(Map<String, dynamic> json) =>
      _$GameModuleLevelDtoFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'order_index')
  final int orderIndex;

  /// Create a copy of GameModuleLevelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GameModuleLevelDtoCopyWith<_GameModuleLevelDto> get copyWith =>
      __$GameModuleLevelDtoCopyWithImpl<_GameModuleLevelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GameModuleLevelDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameModuleLevelDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, orderIndex);

  @override
  String toString() {
    return 'GameModuleLevelDto(id: $id, title: $title, orderIndex: $orderIndex)';
  }
}

/// @nodoc
abstract mixin class _$GameModuleLevelDtoCopyWith<$Res>
    implements $GameModuleLevelDtoCopyWith<$Res> {
  factory _$GameModuleLevelDtoCopyWith(
          _GameModuleLevelDto value, $Res Function(_GameModuleLevelDto) _then) =
      __$GameModuleLevelDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String title, @JsonKey(name: 'order_index') int orderIndex});
}

/// @nodoc
class __$GameModuleLevelDtoCopyWithImpl<$Res>
    implements _$GameModuleLevelDtoCopyWith<$Res> {
  __$GameModuleLevelDtoCopyWithImpl(this._self, this._then);

  final _GameModuleLevelDto _self;
  final $Res Function(_GameModuleLevelDto) _then;

  /// Create a copy of GameModuleLevelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? orderIndex = null,
  }) {
    return _then(_GameModuleLevelDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _self.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
