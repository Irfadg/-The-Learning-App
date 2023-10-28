import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'counter/counter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CounterBloc(),
      child: MaterialApp(
        title: 'Focused Learning App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Focused Learning App'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
    print('thiss print is working');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<CounterBloc>(context).state.count}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed:() => BlocProvider.of<CounterBloc>(context).add(const Increment()) ,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
             FloatingActionButton(
            onPressed:() => BlocProvider.of<CounterBloc>(context).add(const Decrement()) ,
            tooltip: 'Increment',
            child: const Icon(Icons.deblur),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
