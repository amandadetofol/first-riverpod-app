import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp(),),);
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(countStateProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Riverpod demo'),),
        body: Column(children: [
          Text('Value $value'),
          FloatingActionButton(onPressed: (){
            ref.read(countStateProvider.state).state++;
          })
        ],),
      ),
    );
  }

}

final countStateProvider = StateProvider<int>((ref) => 0);
