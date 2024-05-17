import 'package:gigachat_dart/gigachat_dart.dart';
import 'package:http/http.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_gigachat/src/llms/mappers.dart';
import 'package:langchain_gigachat/src/llms/types.dart';

class GigaChat extends BaseLLM<GigaChatOptions> {
  GigaChat({
    required String clientId,
    required String clientSecret,
    String? baseUrl,
    Map<String, String> queryParams = const {},
    Client? client,
    super.defaultOptions = const GigaChatOptions(),
  }) : _client = GigachatClient(
          clientId: clientId,
          clientSecret: clientSecret,
          queryParams: queryParams,
          baseUrl: baseUrl,
          client: client,
        );

  final GigachatClient _client;

  @override
  Future<LLMResult> invoke(
    PromptValue input, {
    GigaChatOptions? options,
  }) async {
    final completion = await _client.generateChatCompletion(
      request: _createCompletionRequest(input: input, options: options),
    );
    return completion.toLLMResults().first;
  }

  @override
  Stream<LLMResult> stream(PromptValue input, {GigaChatOptions? options}) {
    return _client
        .generateChatCompletionStream(
          request: _createCompletionRequest(input: input, options: options),
        )
        .map<LLMResult>((event) => event.toLLMResults().first);
  }

  Chat _createCompletionRequest({
    required PromptValue input,
    GigaChatOptions? options,
  }) {
    return Chat(
      model: options?.model ?? defaultOptions.model,
      messages: _mapMessages(input),
      temperature: options?.temperature ?? defaultOptions.temperature,
      topP: options?.topP ?? defaultOptions.topP,
      n: options?.n ?? defaultOptions.n,
      maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
      repetitionPenalty: options?.repeatPenalty ?? defaultOptions.repeatPenalty,
      updateInterval:
          (options?.updateInterval ?? defaultOptions.updateInterval).toDouble(),
    );
  }

  List<Message> _mapMessages(PromptValue prompt) {
    return prompt
        .toChatMessages()
        .map(
          (e) => Message(
            content: e.contentAsString,
            role: switch (e) {
              HumanChatMessage() => MessageRole.user,
              SystemChatMessage() => MessageRole.system,
              AIChatMessage() => MessageRole.assistant,
              ToolChatMessage() => MessageRole.function,
              CustomChatMessage() => MessageRole.system,
            },
          ),
        )
        .toList(growable: false);
  }

  @override
  String get modelType => 'gigachat';

  @override
  Future<List<int>> tokenize(
    PromptValue promptValue, {
    GigaChatOptions? options,
  }) {
    throw UnimplementedError();
  }
}
