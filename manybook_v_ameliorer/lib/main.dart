import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manybook/views/HomePage.dart';
import 'package:manybook/views/Splashscreen.dart';
import 'package:manybook/views/search.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //if you need binding initialize before runapp you should be call this function.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EbookApp',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      initialRoute: "/splash",
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) {
          return Splashscreen();
        },
        "/home": (BuildContext context) {
          return HomePage();
        },
        "/search": (BuildContext context) {
          return SearchPage();
        }
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {
//         return Provone();
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Provider"),
//           ),
//           body: Center(
//             child: Column(
//               children: [
//                 Consumer<Provone>(builder: (context, prov, child) {
//                   return Text("");
//                 })
//               ],
//             ),
//           ),
//           floatingActionButton: Consumer<Provone>(builder: (context, p, child) {
//             return FloatingActionButton(onPressed: () => p.increment());
//           })),
//     );
//   }
// }

// class Provone with ChangeNotifier {
//   int a = 1;

//   increment() {
//     a++;
//   }
// }
