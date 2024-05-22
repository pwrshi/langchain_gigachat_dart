import 'package:gigachat_dart/gigachat_dart.dart';
import 'package:http/http.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_gigachat/src/llms/mappers.dart';
import 'package:langchain_gigachat/src/llms/types.dart';

/// Wrapper around [GigaChat API](https://developers.sber.ru/docs/ru/gigachat/overview).
///
/// Example:
/// ```dart
/// final llm = GigaChat(
///   clientId: 'SBER_CLIENT_ID',
///   clientSecret: 'SBER_CLIENT_SECRET',
/// );;
/// final prompt = PromptValue.string('Tell me a joke');
/// final res = await llm.invoke(prompt);
/// ```
///
/// Options:
///```dart
/// final llm = GigaChat(
///   clientId: 'SBER_CLIENT_ID',
///   clientSecret: 'SBER_CLIENT_SECRET',
///   defaultOptions: const GigaChatOptions(
///     temperature: 0.9,
///     maxTokens: 100,
///   ),
/// );
///
///
/// ### Authentication
///
/// The GigaChat uses uuid_v4 for clientId and clientSecret for get accessToken.
/// This implementation update access token auto.
/// For start work with GigaChat you can create
/// [developer account](https://developers.sber.ru/studio/workspaces/)
/// and create project  GigaChat API
class GigaChat extends BaseLLM<GigaChatOptions> {
  /// Constructor for work with GigaChat via BaseLLM interface
  /// from langchain dart
  ///
  /// ### Https issues
  /// Client is abstract http client from `package:http`.
  /// If you faced with certificate errors
  /// you may ignore it:
  /// ```dart
  /// HttpClient client = new HttpClient();
  /// client..badCertificateCallback =
  /// ((X509Certificate cert, String host, int port) => true);
  /// var ioClient = new IOClient(client);
  /// http.Response resp = await ioClient.post(
  ///   uri,
  ///   body: utf8.encode(json.encode(body)),
  ///   headers: headers,
  /// );
  /// ```
  /// Or you can install
  /// [russian government certificates](https://www.gosuslugi.ru/crt)
  ///
  ///
  /// ### Authentication
  ///
  /// The GigaChat uses uuid_v4 for clientId and clientSecret
  /// for get accessToken.
  ///
  /// This implementation update access token auto.
  ///
  /// For start work with GigaChat you can create
  /// [developer account](https://developers.sber.ru/studio/workspaces/)
  /// and create project  GigaChat API
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
          scope: defaultOptions.scope,
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
