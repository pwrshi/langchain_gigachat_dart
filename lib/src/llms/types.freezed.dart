// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GigaChatOptions {
  /// The model used to generate completions
  /// default 'GigaChat'
  String get model => throw _privateConstructorUsedError;

  /// The temperature of the model. Increasing the temperature
  /// will make the model answer more creatively.
  double? get temperature => throw _privateConstructorUsedError;

  /// An alternative to sampling with temperature, called nucleus
  /// sampling, where the model considers the
  /// results of the tokens with top_p probability mass.
  double? get topP => throw _privateConstructorUsedError;

  /// How many completions to generate for each prompt.
  int get n => throw _privateConstructorUsedError;

  /// The maximum number of tokens to generate in the completion.
  int get maxTokens => throw _privateConstructorUsedError;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.8)
  /// will be more lenient. (Default: 1.0)
  double? get repeatPenalty => throw _privateConstructorUsedError;

  /// Sets that the message will arrive in parts
  bool? get stream => throw _privateConstructorUsedError;

  /// Sets the time interval for transmitting parts of messages in seconds
  num get updateInterval => throw _privateConstructorUsedError;

  /// Used for versioning between corporates or individuals,
  /// GIGACHAT_API_CORP and GIGACHAT_API_PERS, respectively
  String get scope => throw _privateConstructorUsedError;

  /// Sets limit for concurrecy runnig (Default: 1)
  int get concurrencyLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GigaChatOptionsCopyWith<GigaChatOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GigaChatOptionsCopyWith<$Res> {
  factory $GigaChatOptionsCopyWith(
          GigaChatOptions value, $Res Function(GigaChatOptions) then) =
      _$GigaChatOptionsCopyWithImpl<$Res, GigaChatOptions>;
  @useResult
  $Res call(
      {String model,
      double? temperature,
      double? topP,
      int n,
      int maxTokens,
      double? repeatPenalty,
      bool? stream,
      num updateInterval,
      String scope,
      int concurrencyLimit});
}

/// @nodoc
class _$GigaChatOptionsCopyWithImpl<$Res, $Val extends GigaChatOptions>
    implements $GigaChatOptionsCopyWith<$Res> {
  _$GigaChatOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? n = null,
    Object? maxTokens = null,
    Object? repeatPenalty = freezed,
    Object? stream = freezed,
    Object? updateInterval = null,
    Object? scope = null,
    Object? concurrencyLimit = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      n: null == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      repeatPenalty: freezed == repeatPenalty
          ? _value.repeatPenalty
          : repeatPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateInterval: null == updateInterval
          ? _value.updateInterval
          : updateInterval // ignore: cast_nullable_to_non_nullable
              as num,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      concurrencyLimit: null == concurrencyLimit
          ? _value.concurrencyLimit
          : concurrencyLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GigaChatOptionsImplCopyWith<$Res>
    implements $GigaChatOptionsCopyWith<$Res> {
  factory _$$GigaChatOptionsImplCopyWith(_$GigaChatOptionsImpl value,
          $Res Function(_$GigaChatOptionsImpl) then) =
      __$$GigaChatOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      double? temperature,
      double? topP,
      int n,
      int maxTokens,
      double? repeatPenalty,
      bool? stream,
      num updateInterval,
      String scope,
      int concurrencyLimit});
}

/// @nodoc
class __$$GigaChatOptionsImplCopyWithImpl<$Res>
    extends _$GigaChatOptionsCopyWithImpl<$Res, _$GigaChatOptionsImpl>
    implements _$$GigaChatOptionsImplCopyWith<$Res> {
  __$$GigaChatOptionsImplCopyWithImpl(
      _$GigaChatOptionsImpl _value, $Res Function(_$GigaChatOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? n = null,
    Object? maxTokens = null,
    Object? repeatPenalty = freezed,
    Object? stream = freezed,
    Object? updateInterval = null,
    Object? scope = null,
    Object? concurrencyLimit = null,
  }) {
    return _then(_$GigaChatOptionsImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      n: null == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      repeatPenalty: freezed == repeatPenalty
          ? _value.repeatPenalty
          : repeatPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateInterval: null == updateInterval
          ? _value.updateInterval
          : updateInterval // ignore: cast_nullable_to_non_nullable
              as num,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      concurrencyLimit: null == concurrencyLimit
          ? _value.concurrencyLimit
          : concurrencyLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GigaChatOptionsImpl implements _GigaChatOptions {
  const _$GigaChatOptionsImpl(
      {this.model = 'GigaChat',
      this.temperature,
      this.topP,
      this.n = 1,
      this.maxTokens = 1024,
      this.repeatPenalty,
      this.stream,
      this.updateInterval = 0.0,
      this.scope = 'GIGACHAT_API_PERS',
      this.concurrencyLimit = 1});

  /// The model used to generate completions
  /// default 'GigaChat'
  @override
  @JsonKey()
  final String model;

  /// The temperature of the model. Increasing the temperature
  /// will make the model answer more creatively.
  @override
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus
  /// sampling, where the model considers the
  /// results of the tokens with top_p probability mass.
  @override
  final double? topP;

  /// How many completions to generate for each prompt.
  @override
  @JsonKey()
  final int n;

  /// The maximum number of tokens to generate in the completion.
  @override
  @JsonKey()
  final int maxTokens;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.8)
  /// will be more lenient. (Default: 1.0)
  @override
  final double? repeatPenalty;

  /// Sets that the message will arrive in parts
  @override
  final bool? stream;

  /// Sets the time interval for transmitting parts of messages in seconds
  @override
  @JsonKey()
  final num updateInterval;

  /// Used for versioning between corporates or individuals,
  /// GIGACHAT_API_CORP and GIGACHAT_API_PERS, respectively
  @override
  @JsonKey()
  final String scope;

  /// Sets limit for concurrecy runnig (Default: 1)
  @override
  @JsonKey()
  final int concurrencyLimit;

  @override
  String toString() {
    return 'GigaChatOptions(model: $model, temperature: $temperature, topP: $topP, n: $n, maxTokens: $maxTokens, repeatPenalty: $repeatPenalty, stream: $stream, updateInterval: $updateInterval, scope: $scope, concurrencyLimit: $concurrencyLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GigaChatOptionsImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.n, n) || other.n == n) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.repeatPenalty, repeatPenalty) ||
                other.repeatPenalty == repeatPenalty) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.updateInterval, updateInterval) ||
                other.updateInterval == updateInterval) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.concurrencyLimit, concurrencyLimit) ||
                other.concurrencyLimit == concurrencyLimit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      temperature,
      topP,
      n,
      maxTokens,
      repeatPenalty,
      stream,
      updateInterval,
      scope,
      concurrencyLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GigaChatOptionsImplCopyWith<_$GigaChatOptionsImpl> get copyWith =>
      __$$GigaChatOptionsImplCopyWithImpl<_$GigaChatOptionsImpl>(
          this, _$identity);
}

abstract class _GigaChatOptions implements GigaChatOptions {
  const factory _GigaChatOptions(
      {final String model,
      final double? temperature,
      final double? topP,
      final int n,
      final int maxTokens,
      final double? repeatPenalty,
      final bool? stream,
      final num updateInterval,
      final String scope,
      final int concurrencyLimit}) = _$GigaChatOptionsImpl;

  @override

  /// The model used to generate completions
  /// default 'GigaChat'
  String get model;
  @override

  /// The temperature of the model. Increasing the temperature
  /// will make the model answer more creatively.
  double? get temperature;
  @override

  /// An alternative to sampling with temperature, called nucleus
  /// sampling, where the model considers the
  /// results of the tokens with top_p probability mass.
  double? get topP;
  @override

  /// How many completions to generate for each prompt.
  int get n;
  @override

  /// The maximum number of tokens to generate in the completion.
  int get maxTokens;
  @override

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.8)
  /// will be more lenient. (Default: 1.0)
  double? get repeatPenalty;
  @override

  /// Sets that the message will arrive in parts
  bool? get stream;
  @override

  /// Sets the time interval for transmitting parts of messages in seconds
  num get updateInterval;
  @override

  /// Used for versioning between corporates or individuals,
  /// GIGACHAT_API_CORP and GIGACHAT_API_PERS, respectively
  String get scope;
  @override

  /// Sets limit for concurrecy runnig (Default: 1)
  int get concurrencyLimit;
  @override
  @JsonKey(ignore: true)
  _$$GigaChatOptionsImplCopyWith<_$GigaChatOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
