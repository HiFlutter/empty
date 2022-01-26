<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A widget that displays states of screen like loadingType, error, empty etc.

## Screenshot
<img width="270" height="480" src="https://github.com/HiFlutter/empty/blob/master/iamges/device-2022-01-26-145706.gif"/>


## Getting started
pubspec.yaml
```dart
    dependencies:
      flutter_loadmore_any: <latest_version>
```
Import it
```dart
    import 'package:flutter_empty/flutter_empty.dart';
```


## Usage

```dart
EmptyView(
      widget: Text('内容'),
      loading: true,
    )
```
