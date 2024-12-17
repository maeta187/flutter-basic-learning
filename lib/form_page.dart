import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class FormFocusManager {
  final Map<String, FocusNode> _focusNodes = {};

  FocusNode getFocusNode(String fieldId) {
    return _focusNodes.putIfAbsent(fieldId, () {
      final node = FocusNode();
      node.addListener(() {
        if (node.hasFocus) {
          developer.log('$fieldId gained focus');
        } else {
          developer.log('$fieldId lost focus');
        }
      });
      return node;
    });
  }

  void dispose() {
    for (final node in _focusNodes.values) {
      node.dispose();
    }
    _focusNodes.clear();
  }
}

class _FormPageState extends State<FormPage> {
  /// 初回アクセス時に FocusNode が作成される（遅延初期化）
  /// 1度作成されたら、その FocusNode インスタンスは変更できない
  /// メモリ効率と型安全性の両方のメリットを得られる
  late final _focusManager = FormFocusManager();

  final myController = TextEditingController();

  void _printLatestValue() {
    developer.log('Current Text is: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();

    /// テキストフィールドの変更を監視する
    myController.addListener(_printLatestValue);
  }

  // ウィジェットツリーから完全に削除されるとき、ページを離れるとき、アプリが終了する時に呼ばれる
  @override
  void dispose() {
    _focusManager.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Form Page'),
      ),
      body: Center(
        widthFactor: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'John Doe',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
                focusNode: _focusManager.getFocusNode('username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: myController,
                // onChanged: (text) {
                //   developer.log('First text field: $text');
                // },
                focusNode: _focusManager.getFocusNode('hobby'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'hobby',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 対象のinputへフォーカスを当てる
                _focusManager.getFocusNode('username').requestFocus();
              },
              child: const Text('Focus'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Alert'),
                        content: Text(myController.text),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          )
                        ],
                      );
                    });
              },
              child: const Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}
