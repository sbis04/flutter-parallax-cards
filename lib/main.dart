import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parallax Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sensors Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<double>? _accelerometerValues;
//   late final StreamSubscription<dynamic> _streamSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _streamSubscription = accelerometerEvents.listen(
//       (AccelerometerEvent event) {
//         setState(() {
//           _accelerometerValues = <double>[event.x, event.y, event.z];
//         });
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _streamSubscription.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final accelerometer =
//         _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sensor Example'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text('Accelerometer: $accelerometer'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
