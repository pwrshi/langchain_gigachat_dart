import 'package:collection/collection.dart';
import 'package:gigachat_dart/gigachat_dart.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';

/// mappings for gigachat_dart
extension ChatMessageMapper on List<ChatMessage> {
  /// map gigachat_dart List of messages from langchain interface
  List<Message> toMessages({bool streaming = false}) {
    return map<Message>(_mapMessage).toList(growable: false);
  }

  Message _mapMessage(ChatMessage message) {
    late final MessageRole role;
    late final String content;
    switch (message) {
      case SystemChatMessage():
        role = MessageRole.system;
        content = message.content;
      case HumanChatMessage():
        role = MessageRole.user;
        content = switch (message.content) {
          ChatMessageContentImage() => throw UnsupportedError(
              'Images in input is not supported in GigaChat',
            ),
          ChatMessageContentText() =>
            (message.content as ChatMessageContentText).text,
          ChatMessageContentMultiModal() =>
            throw UnsupportedError('Multimodal is not supported in GigaChat'),
        };
      case AIChatMessage():
        role = MessageRole.assistant;
        content = message.content;
      case ToolChatMessage():
        role = MessageRole.function;
        content = message.content;
      case CustomChatMessage():
        throw UnsupportedError('Custom chat not supported in GigaChat');
    }
    return Message(role: role, content: content);
  }
}

/// mappings for gigachat_dart
extension ChatResultMapper on ChatCompletion {
  /// map gigachat_dart List of messages to langchain interface
  List<ChatResult> toChatResults() {
    return choices!
        .mapIndexed(
          (int index, Choices choice) => ChatResult(
            id: '${choice.index}:$index',
            output: AIChatMessage(content: choice.message?.content ?? ''),
            finishReason: _mapFinishReason(choice.finishReason),
            metadata: {
              'created': created,
              'model': model,
              'object': object,
            },
            usage: _mapUsage(usage),
          ),
        )
        .toList(growable: false);
  }

  FinishReason _mapFinishReason(ChoicesFinishReason? reason) =>
      switch (reason) {
        ChoicesFinishReason.stop => FinishReason.stop,
        ChoicesFinishReason.length => FinishReason.length,
        ChoicesFinishReason.blacklist => FinishReason.contentFilter,
        ChoicesFinishReason.functionCall => FinishReason.toolCalls,
        null => FinishReason.unspecified,
      };

  LanguageModelUsage _mapUsage(Usage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

/// mappings for gigachat_dart
extension LLMResultMapperStream on ChatCompletionStream {
  /// map gigachat_dart List of messages to langchain interface for streams
  List<ChatResult> toChatResults() {
    return choices!
        .mapIndexed(
          (int index, ChoicesChunk choice) => ChatResult(
            id: '${choice.index}:$index',
            output: AIChatMessage(content: choice.delta?.content ?? ''),
            finishReason: _mapFinishReason(choice.finishReason),
            metadata: {
              'created': created,
              'model': model,
              'object': object,
            },
            usage: _mapUsage(usage),
            streaming: true,
          ),
        )
        .toList(growable: false);
  }

  FinishReason _mapFinishReason(ChoicesChunkFinishReason? reason) =>
      switch (reason) {
        ChoicesChunkFinishReason.stop => FinishReason.stop,
        ChoicesChunkFinishReason.length => FinishReason.length,
        ChoicesChunkFinishReason.blacklist => FinishReason.contentFilter,
        ChoicesChunkFinishReason.functionCall => FinishReason.toolCalls,
        null => FinishReason.unspecified,
      };

  LanguageModelUsage _mapUsage(Usage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}
