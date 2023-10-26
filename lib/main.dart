import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_v2/app/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_v2/data/models/entry_model.dart';

import 'data/models/trip_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open your box.
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

  //
  if (!Hive.isAdapterRegistered(0) && !Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TripModelAdapter());
    Hive.registerAdapter(EntryModelAdapter());
  }

  await Hive.openBox<TripModel>('trips');
  await Hive.openBox<EntryModel>('entries');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      // home: const HomeScreen(), /
      // /MyHomePage(),
    );
  }
}
