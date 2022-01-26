import 'package:flutter/cupertino.dart';
import 'package:flutter_empty/flutter_empty.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty', () {
    const EmptyView(
      widget: Text('内容'),
      loading: true,
    );
  });
}
