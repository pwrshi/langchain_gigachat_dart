import 'dart:io';

import 'package:langchain_core/documents.dart';
import 'package:langchain_gigachat/src/embeddings/embeddings.dart';
import 'package:test/test.dart';

void main() {
  late final GigaChatEmbeddings cge;

  setUpAll(() async {
    cge = GigaChatEmbeddings(
      clientId: Platform.environment['SBER_CLIENT_ID']!,
      clientSecret: Platform.environment['SBER_CLIENT_SECRET']!,
    );
  });

  group('GigaChatEmbeddings', () {
    test('generate from string', () async {
      final r = await cge.embedQuery('Как так можно то???!!!');
      expect(r, isNotEmpty);
    });

    test('generate from docs', () async {
      final r = await cge.embedDocuments([
        const Document(pageContent: 'Кто ты'),
        const Document(pageContent: 'А кто я'),
      ]);
      expect(r.length, equals(2));
      expect(r.every((li) => li.isNotEmpty), true);
    });
  });
}
