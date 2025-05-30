import 'package:first/Routes/Profile/Profile.dart';
import 'package:first/components/services.dart';
import 'package:first/pages/home.dart';
import 'package:first/pages/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
  );
  await Hive.initFlutter();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
// void main() {
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(systemNavigationBarColor: Colors.white),
//   );

//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nurse mate',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffF8FAFC),
        scaffoldBackgroundColor: Color.fromARGB(255, 247, 251, 255),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffF8FAFC),
          elevation: 0, // Optional: removes shadow for a flat look
          iconTheme: IconThemeData(color: Colors.black), // Optional: icon color
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Color(0xff1AB5BF),
          secondary: Color(0xff1A2C42),
          surface: Color(0xffFFFFFF),
          onPrimary: Colors.white, // Text/icon color on primary
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
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
  List<Widget> pages = [const Services(), const History(), const Profile()];

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Container(
        height: 55,
        padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 1),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentpage = 0;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/home.png",
                    width: 23,
                    height: 23,
                    color:
                        currentpage == 0
                            ? Color(0xff3E69FE)
                            : const Color.fromARGB(188, 79, 79, 79),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color:
                          currentpage == 0
                              ? Color(0xff3E69FE)
                              : const Color.fromARGB(188, 79, 79, 79),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentpage = 1;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 25,
                    color: currentpage == 1 ? Colors.cyan : Color(0xff333333),
                  ),
                  Text(
                    "Bookings",
                    style: TextStyle(
                      color:
                          currentpage == 1 ? Colors.cyan : Color(0xff333333),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Profile
            GestureDetector(
              onTap: () {
                setState(() {
                  currentpage = 2;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                    color: currentpage == 2 ? Colors.cyan : Color(0xff333333),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color:
                          currentpage == 2 ? Colors.cyan : Color(0xff333333),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
