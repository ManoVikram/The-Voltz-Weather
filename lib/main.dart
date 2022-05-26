import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import './constants.dart';

import './current_weather/view/current_weather_screen.dart';

import './current_weather/data_providers/weather_api_client.dart';
import './current_weather/repositories/repositories.dart';
import './current_weather/bloc/bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final WeatherRepository repository;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Open Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(repository: widget.repository),
        child: const WeatherApp(),
      ),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrentWeatherScreen(),
    );
  }
}

class WeatherBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition);
    print('${bloc.runtimeType} $transition');
  }
}

void main(List<String> args) {
  final WeatherRepository repository = WeatherRepository(
    weatherAPIClient: WeatherAPIClient(httpClient: http.Client()),
  );

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(repository: repository));
    },
    blocObserver: WeatherBlocObserver(),
  );
}

// Check this site for more details on the app architecture
// - https://medium.com/flutter-community/flutter-essential-what-you-need-to-know-567ad25dcd8f