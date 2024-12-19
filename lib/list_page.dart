import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Page'),
        ),
        body: SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160,
                        color: Colors.red,
                      ),
                      Container(
                        width: 160,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 160,
                        color: Colors.green,
                      ),
                      Container(
                        width: 160,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 160,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: GridView.count(
                //     crossAxisCount: 3,
                //     children: List.generate(100, (index) {
                //       return Column(
                //         children: <Widget>[
                //           Expanded(
                //               child: Image.network(
                //                   'https://picsum.photos/250?image=$index')),
                //           Text(
                //             'Item $index',
                //             style: Theme.of(context).textTheme.headlineSmall,
                //           ),
                //         ],
                //       );
                //     }),
                //   ),
                // ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: items.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         leading: Icon(Icons.map),
                //         title: Text(items[index]),
                //       );
                //     },
                //   ),
                // ),
                // Expanded(
                //   child: ListView(
                //     children: <Widget>[
                //       ListTile(
                //         leading: Icon(Icons.map),
                //         title: Text('Map'),
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.phone_android),
                //         title: Text('Android'),
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.phone_iphone),
                //         title: Text('iPhone'),
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.arrow_back_ios),
                //         title: Text('戻る'),
                //         onTap: () {
                //           Navigator.pop(context);
                //         },
                //       ),
                //     ],
                //   ),
                // )
              ],
            )));
  }
}
