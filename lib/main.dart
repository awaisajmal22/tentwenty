import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tentwenty_test/config/router/pages.dart';
import 'package:tentwenty_test/config/router/routes.dart';
import 'package:tentwenty_test/core/bloc/detail_bloc/detail_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_bloc.dart';
import 'package:tentwenty_test/core/bloc/watch_bloc/watch_event.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/repositories/detail_repo/detail_repo.dart';
import 'package:tentwenty_test/data/repositories/detail_repo/dio_detail_repo.dart';
import 'package:tentwenty_test/data/repositories/watch_repo/dio_watch_repo.dart';
import 'package:tentwenty_test/data/repositories/watch_repo/watch_repo.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                WatchBloc(repo: getIt())),
        BlocProvider(
            create: (_) =>
                DetailBloc(repo: getIt())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorPalette.offwhite,
          appBarTheme: AppBarTheme(backgroundColor: ColorPalette.white),
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.dashboard,
        onGenerateRoute: Pages.onGeneratingRoute,
      ),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<WatchRepo>(() => DioWatchRepo());
  getIt.registerLazySingleton<DetailRepo>(() => DioDetailRepo());
}
