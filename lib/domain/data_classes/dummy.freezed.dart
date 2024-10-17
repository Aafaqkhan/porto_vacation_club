// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Dummy {
  ApiResponse<dynamic>? get airlineRes => throw _privateConstructorUsedError;
  ApiResponse<dynamic>? get userRes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DummyCopyWith<Dummy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyCopyWith<$Res> {
  factory $DummyCopyWith(Dummy value, $Res Function(Dummy) then) =
      _$DummyCopyWithImpl<$Res, Dummy>;
  @useResult
  $Res call({ApiResponse<dynamic>? airlineRes, ApiResponse<dynamic>? userRes});
}

/// @nodoc
class _$DummyCopyWithImpl<$Res, $Val extends Dummy>
    implements $DummyCopyWith<$Res> {
  _$DummyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airlineRes = freezed,
    Object? userRes = freezed,
  }) {
    return _then(_value.copyWith(
      airlineRes: freezed == airlineRes
          ? _value.airlineRes
          : airlineRes // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>?,
      userRes: freezed == userRes
          ? _value.userRes
          : userRes // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$dummyImplCopyWith<$Res> implements $DummyCopyWith<$Res> {
  factory _$$dummyImplCopyWith(
          _$dummyImpl value, $Res Function(_$dummyImpl) then) =
      __$$dummyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiResponse<dynamic>? airlineRes, ApiResponse<dynamic>? userRes});
}

/// @nodoc
class __$$dummyImplCopyWithImpl<$Res>
    extends _$DummyCopyWithImpl<$Res, _$dummyImpl>
    implements _$$dummyImplCopyWith<$Res> {
  __$$dummyImplCopyWithImpl(
      _$dummyImpl _value, $Res Function(_$dummyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airlineRes = freezed,
    Object? userRes = freezed,
  }) {
    return _then(_$dummyImpl(
      airlineRes: freezed == airlineRes
          ? _value.airlineRes
          : airlineRes // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>?,
      userRes: freezed == userRes
          ? _value.userRes
          : userRes // ignore: cast_nullable_to_non_nullable
              as ApiResponse<dynamic>?,
    ));
  }
}

/// @nodoc

class _$dummyImpl implements _dummy {
  const _$dummyImpl({this.airlineRes, this.userRes});

  @override
  final ApiResponse<dynamic>? airlineRes;
  @override
  final ApiResponse<dynamic>? userRes;

  @override
  String toString() {
    return 'Dummy(airlineRes: $airlineRes, userRes: $userRes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$dummyImpl &&
            (identical(other.airlineRes, airlineRes) ||
                other.airlineRes == airlineRes) &&
            (identical(other.userRes, userRes) || other.userRes == userRes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, airlineRes, userRes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$dummyImplCopyWith<_$dummyImpl> get copyWith =>
      __$$dummyImplCopyWithImpl<_$dummyImpl>(this, _$identity);
}

abstract class _dummy implements Dummy {
  const factory _dummy(
      {final ApiResponse<dynamic>? airlineRes,
      final ApiResponse<dynamic>? userRes}) = _$dummyImpl;

  @override
  ApiResponse<dynamic>? get airlineRes;
  @override
  ApiResponse<dynamic>? get userRes;
  @override
  @JsonKey(ignore: true)
  _$$dummyImplCopyWith<_$dummyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
