import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the next page'),
              Text(name),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, '戻り値');
                  },
                  child: const Text('戻る'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
