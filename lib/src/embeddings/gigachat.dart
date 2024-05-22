// ignore_for_file: implementation_imports

import 'package:gigachat_dart/gigachat_dart.dart';
import 'package:http/src/client.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/src/documents/document.dart';

/// GigaChat client for generate embeddings.
/// Wrapper around [GigaChat API](https://developers.sber.ru/docs/ru/gigachat/overview).
///
/// ### Authentication
///
/// The GigaChat uses uuid_v4 for clientId and clientSecret for get accessToken.
/// This implementation update access token auto.
/// For start work with GigaChat you can create
/// [developer account](https://developers.sber.ru/studio/workspaces/)
/// and create project  GigaChat API
class GigaChatEmbeddings implements Embeddings {
  /// Default constructor for generate embeddings
  /// Client -- is abstract HttpClient. If you faced with certificate errors
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
  GigaChatEmbeddings({
    required String clientId,
    required String clientSecret,
    String? baseUrl,
    Map<String, String> queryParams = const {},
    Client? client,
    this.model = 'Embeddings',
    // this.batchSize = 512,
    String scope = 'GIGACHAT_API_PERS',
  }) : _client = GigachatClient(
          clientId: clientId,
          clientSecret: clientSecret,
          queryParams: queryParams,
          baseUrl: baseUrl,
          client: client,
          scope: scope,
        );
  late final GigachatClient _client;

  /// model for generate embedding (default GigaChat)
  String model;
  // int batchSize;
  @override
  Future<List<List<double>>> embedDocuments(List<Document> documents) async {
    // final batches = chunkList(documents, chunkSize: batchSize);

    final data = await _client.generateEmbedding(
      request: EmbeddingsBody(
        model: model,
        input: documents.map((e) => e.pageContent).toList(growable: false),
      ),
    );
    return data.data
        .map(
          (d) => d.embedding.map((e) => e.toDouble()).toList(growable: false),
        )
        .toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(String query) async {
    final data = await _client.generateEmbedding(
      request: EmbeddingsBody(
        model: model,
        input: [query],
      ),
    );
    final body = data.data.first.embedding
        .map((e) => e.toDouble())
        .toList(growable: false);
    return body;
  }
}
