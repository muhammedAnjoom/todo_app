import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screen/screen_home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocmentsDirectroy =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocmentsDirectroy.path);
  Hive.registerAdapter<Todo>(TodoAdapter());
  await Hive.openBox<Todo>("todo");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}
