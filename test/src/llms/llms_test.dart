import 'dart:io';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/src/output_parsers/string.dart';
import 'package:langchain_gigachat/src/llms/gigachat.dart';
import 'package:langchain_gigachat/src/llms/types.dart';
import 'package:test/test.dart';

void main() {
  late final GigaChat cgc;

  setUpAll(() async {
    cgc = GigaChat(
      clientId: Platform.environment['SBER_CLIENT_ID']!,
      clientSecret: Platform.environment['SBER_CLIENT_SECRET']!,
    );
  });

  group('ChatGigaChat', () {
    test('invoke string', () async {
      final res = await cgc.invoke(PromptValue.string('Почему небо красное?'));
      expect(res.id, isNotEmpty);
      expect(res.streaming, false);
      expect(res.output, isNotEmpty);
      expect(res.finishReason, FinishReason.stop);
      expect(res.usage.promptTokens, isNotNull);
      expect(res.usage.totalTokens, isNotNull);
      expect(res.usage.responseTokens, isNotNull);
    });

    test('invoke chat', () async {
      final prompt = PromptValue.chat([
        ChatMessage.humanText(
          'List the numbers from 1 to 9 in order. '
          'Output ONLY the numbers in one line without any spaces or commas. '
          'NUMBERS:',
        ),
        ChatMessage.ai('123456789'),
        ChatMessage.humanText(
          'Remove the number "4" from the list',
        ),
      ]);
      final res = await cgc.invoke(
        prompt,
        options: const GigaChatOptions(temperature: 0.1),
      );
      expect(
        res.output,
        contains('35'),
      );

      expect(res.id, isNotEmpty);
      expect(res.streaming, false);
      // expect(res.output.content, isNotEmpty);
      expect(res.finishReason, FinishReason.stop);
      expect(res.usage.promptTokens, isNotNull);
      expect(res.usage.totalTokens, isNotNull);
      expect(res.usage.responseTokens, isNotNull);
    });

    test('stream', () async {
      final promptTemplate = PromptTemplate.fromTemplate(
        'List the numbers from 1 to {max_num} in order. '
        'Output ONLY the numbers in one line with commas. '
        'NUMBERS:',
      );
      const stringOutputParser = StringOutputParser<LLMResult>();

      final chain = promptTemplate.pipe(cgc).pipe(stringOutputParser);

      // cause first message is very big, then return by one token
      final stream = chain.stream({'max_num': '200'});

      final content = StringBuffer();
      var count = 0;
      await for (final res in stream) {
        content.write(res);
        count++;
      }
      expect(
        content.toString().split(RegExp(r'\D')),
        containsAllInOrder(['1', '2', '3', '20', '31']),
      );
      expect(count, greaterThan(1));
    });
  });
}
