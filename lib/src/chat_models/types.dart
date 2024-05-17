import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langchain_core/llms.dart';

part 'types.freezed.dart';

/// Generation options to pass into the GigaChat LLM
@freezed
class ChatGigaChatOptions extends LLMOptions with _$ChatGigaChatOptions {
  /// Options for GigaChat LLM
  const factory ChatGigaChatOptions({
    /// The model used to generate completions
    /// default 'GigaChat'
    @Default('GigaChat') String model,

    /// The temperature of the model. Increasing the temperature
    /// will make the model answer more creatively.
    double? temperature,

    /// An alternative to sampling with temperature, called nucleus
    /// sampling, where the model considers the
    /// results of the tokens with top_p probability mass.
    double? topP,

    /// How many completions to generate for each prompt.
    @Default(1) int n,

    /// The maximum number of tokens to generate in the completion.
    @Default(1024) int maxTokens,

    /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
    /// will penalize repetitions more strongly, while a lower value (e.g., 0.8)
    /// will be more lenient. (Default: 1.0)
    double? repeatPenalty,

    /// Sets that the message will arrive in parts
    bool? stream,

    /// Sets the time interval for transmitting parts of messages in seconds
    @Default(0.0) num updateInterval,

    /// Sets limit for concurrecy runnig (Default: 1)
    @Default(1) int concurrencyLimit,
  }) = _ChatGigaChatOptions;
}
