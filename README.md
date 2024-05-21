# Langchain Gigachat

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

langchain_gigachat is a package that provides access to the [GigaChat](https://developers.sber.ru/portal/products/gigachat) API in your Dart applications. This package allows you to interact with the AI and use its capabilities within your app.

## Installation 💻

Install via `dart pub add`:

```sh
dart pub add langchain_gigachat
```

---


## Usage

To use the `langchain_gigachat` package, import it into your Dart file:

```dart
import 'package:langchain_gigachat/langchain_gigachat.dart';
```

Then, create an instance of the `GigaChatClient`:

```dart
final client = GigaChatClient('your_api_key');
```

Replace `'your_api_key'` with the API key provided by Tinkoff AI.

Now, you can use the `client` object to send requests to the GigaChat API:

```dart
Future<Response> response = await client.generateAnswer(Query('What is the capital of Russia?'));
```

The `response` variable will contain the JSON response from the API containing the generated answer.

## Supported Methods

## License

This project is licensed under the MIT License.

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
