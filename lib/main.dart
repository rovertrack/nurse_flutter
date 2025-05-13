import 'package:first/components/services.dart';
import 'package:first/pages/home.dart';
import 'package:first/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
// void main() {

//   // runApp(const MyApp());
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Nurse mate  '),
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
  List<Widget> pages = [
    const Services(),
    const Settings(),
    Center(child: Text('Profile Page')),
  ];

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent resizing when the keyboard is openF
      appBar: AppBar(
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 241, 241, 241),
            height: 1.0,
          ),
        ),
        leading: IconButton(
          onPressed: () => {},
          icon: Image.asset('assets/icons/pin.png', height: 26, width: 26),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/notification1.png',
                height: 22,
                width: 22,
              ),
              onPressed: () => {},
            ),
          ),
          CupertinoButton(child: Icon(Icons.person), onPressed: () => ()),
        ],
        title: Text(widget.title),
      ),
      body: pages[currentpage],
      // body: Center(
      //   child: Column(
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: SearchAnchor(
      //           builder: (BuildContext context, SearchController controller) {
      //             return SearchBar(
      //               controller: controller,
      //               hintText: 'Search...',
      //               onTap: () => log('Tapped'),
      //               padding: const WidgetStatePropertyAll<EdgeInsets>(
      //                 EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
      //               ),
      //               backgroundColor: WidgetStatePropertyAll(Colors.blue[200]),

      //               shape: WidgetStatePropertyAll(
      //                 RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //               ),
      //             );
      //           },
      //           suggestionsBuilder: (
      //             BuildContext context,
      //             SearchController controller,
      //           ) {
      //             return List<ListTile>.generate(5, (int index) {
      //               final String item = 'item $index';
      //               return ListTile(
      //                 title: Text(item),
      //                 onTap: () {
      //                   setState(() {
      //                     controller.closeView(item);
      //                   });
      //                 },
      //               );
      //             });
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: MediaQuery.of(context).size.width * 0.075,
      //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      //   ],

      //   currentIndex: currentpage,
      //   selectedItemColor: Color(0xff3E69FE),
      //   unselectedItemColor: Colors.grey,
      //   onTap: (int index) {
      //     setState(() {
      //       currentpage = index;
      //     });
      //   },
      // ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
