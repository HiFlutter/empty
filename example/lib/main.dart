import 'package:flutter/material.dart';
import 'package:flutter_empty/flutter_empty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool _error = false;
  bool _loading = false;
  bool _empty = false;

  void _modifyStatus() {
    setState(() {
      _counter++;

      if (!_loading && !_error && !_empty) {
        _loading = true;
        _error = false;
        _empty = false;
      } else if (!_error && _loading && !_empty) {
        _error = true;
        _loading = false;
        _empty = false;
      } else if (!_empty && !_loading && _error) {
        _empty = true;
        _error = false;
        _loading = false;
      } else if (!_loading && _empty && !_error) {
        _empty = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: EmptyView(
        error: _error,
        loading: _loading,
        empty: _empty,
        errorPressed: _modifyStatus,
        emptyPressed: _modifyStatus,
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _modifyStatus,
        tooltip: 'ModifyStatus',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
