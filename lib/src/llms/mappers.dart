import 'package:collection/collection.dart';
import 'package:gigachat_dart/gigachat_dart.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';

extension LLMResultMapper on ChatCompletion {
  List<LLMResult> toLLMResults({bool streaming = false}) {
    return choices!
        .mapIndexed(
          (int index, Choices choice) => LLMResult(
            id: '${choice.index}:$index',
            output: choice.message!.content!,
            finishReason: _mapFinishReason(choice.finishReason),
            metadata: {
              'created': created,
              'model': model,
              'object': object,
            },
            usage: _mapUsage(usage),
            streaming: streaming,
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

extension LLMResultMapperStream on ChatCompletionStream {
  List<LLMResult> toLLMResults({bool streaming = true}) {
    return choices!
        .mapIndexed(
          (int index, ChoicesChunk choice) => LLMResult(
            id: '${choice.index}:$index',
            output: choice.delta!.content!,
            finishReason: _mapFinishReason(choice.finishReason),
            metadata: {
              'created': created,
              'model': model,
              'object': object,
            },
            usage: _mapUsage(usage),
            streaming: streaming,
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
