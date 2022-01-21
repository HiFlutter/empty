import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:empty/empty.dart';

void main() {
  test('empty', () {
    const EmptyView(
      widget: Text('内容'),
      loading: true,
    );
  });
}
