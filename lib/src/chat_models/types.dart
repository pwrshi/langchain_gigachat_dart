import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langchain_core/chat_models.dart';
// ignore: implementation_imports
import 'package:langchain_core/src/tools/base.dart';
part 'types.freezed.dart';

/// Generation options to pass into the GigaChat LLM
@freezed
abstract class ChatGigaChatOptions extends ChatModelOptions
    with _$ChatGigaChatOptions {
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

    /// Used for versioning between corporate or individuals,
    /// GIGACHAT_API_CORP and GIGACHAT_API_PERS, respectively
    @Default('GIGACHAT_API_PERS') String scope,

    /// Sets limit for concurrency running (Default: 1)
    @Default(1) int concurrencyLimit,
  }) = _ChatGigaChatOptions;
}
