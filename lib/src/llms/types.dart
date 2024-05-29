import 'package:langchain_core/llms.dart';

/// Generation options to pass into the GigaChat LLM
class GigaChatOptions extends LLMOptions {
  /// Constructor to construct a GigaChatOptions object
  const GigaChatOptions({
    this.model = 'GigaChat',
    this.temperature,
    this.topP,
    this.n = 1,
    this.maxTokens = 1024,
    this.repeatPenalty,
    this.stream,
    this.updateInterval = 0.0,
    this.scope = 'GIGACHAT_API_PERS',
    super.concurrencyLimit = 1,
  });

  /// The model used to generate completions
  /// default 'GigaChat'
  final String model;

  /// The temperature of the model. Increasing the temperature
  /// will make the model answer more creatively.
  final double? temperature;

  /// An alternative to sampling with temperature, called nucleus
  /// sampling, where the model considers the
  /// results of the tokens with top_p probability mass.
  final double? topP;

  /// How many completions to generate for each prompt.
  final int n;

  /// The maximum number of tokens to generate in the completion.
  final int maxTokens;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.8)
  /// will be more lenient. (Default: 1.0)
  final double? repeatPenalty;

  /// Sets that the message will arrive in parts
  final bool? stream;

  /// Sets the time interval for transmitting parts of messages in seconds
  final num updateInterval;

  /// Used for versioning between corporate or individuals,
  /// GIGACHAT_API_CORP and GIGACHAT_API_PERS, respectively
  final String scope;

  /// Limit for concurrency running (Default: 1)
  @override
  int get concurrencyLimit => super.concurrencyLimit;
  set concurrencyLimit(int value) => super.concurrencyLimit;

  /// Creates a copy of this GigaChatOptions with the given values
  GigaChatOptions copyWith({
    String? model,
    double? temperature,
    double? topP,
    int? n,
    int? maxTokens,
    double? repeatPenalty,
    bool? stream,
    num? updateInterval,
    String? scope,
    int? concurrencyLimit,
  }) {
    return GigaChatOptions(
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      n: n ?? this.n,
      maxTokens: maxTokens ?? this.maxTokens,
      repeatPenalty: repeatPenalty ?? this.repeatPenalty,
      stream: stream ?? this.stream,
      updateInterval: updateInterval ?? this.updateInterval,
      scope: scope ?? this.scope,
      concurrencyLimit: concurrencyLimit ?? this.concurrencyLimit,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GigaChatOptions &&
        other.model == model &&
        other.temperature == temperature &&
        other.topP == topP &&
        other.n == n &&
        other.maxTokens == maxTokens &&
        other.repeatPenalty == repeatPenalty &&
        other.stream == stream &&
        other.updateInterval == updateInterval &&
        other.scope == scope &&
        other.concurrencyLimit == concurrencyLimit;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        temperature.hashCode ^
        topP.hashCode ^
        n.hashCode ^
        maxTokens.hashCode ^
        repeatPenalty.hashCode ^
        stream.hashCode ^
        updateInterval.hashCode ^
        scope.hashCode ^
        concurrencyLimit.hashCode;
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'GigaChatOptions(model: $model, temperature: $temperature, topP: $topP, n: $n, maxTokens: $maxTokens, repeatPenalty: $repeatPenalty, stream: $stream, updateInterval: $updateInterval, scope: $scope, concurrencyLimit: $concurrencyLimit)';
  }
}
