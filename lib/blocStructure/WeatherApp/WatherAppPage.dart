import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CitySelection.dart';
import 'CombinedWeatherTemperature.dart';
import 'LastUpdated.dart';
import 'WeatherBloc.dart';
import 'WeatherEvent.dart';
import 'WeatherRepository.dart';
import 'WeatherState.dart';

//https://medium.com/flutter-community/weather-app-with-flutter-bloc-e24a7253340d
// follow link for more
class WetherAppPage extends StatefulWidget {
  final WeatherRepository weatherRepository;

  const WetherAppPage({required Key key, required this.weatherRepository})
      : super(key: key);

  @override
  _WetherAppPageState createState() => _WetherAppPageState();
}

class _WetherAppPageState extends State<WetherAppPage> {
  late WeatherBloc _weatherBloc;
  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(weatherRepository: widget.weatherRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                _weatherBloc.add(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (_, WeatherState state) {
            if (state is WeatherEmpty) {
              return const Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return Container(
                color: Colors.blue[200],
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: <Widget>[
                    //Location(location: weather.location!),
                    Center(
                      child: LastUpdated(dateTime: weather.lastUpdated!),
                    ),
                    CombinedWeatherTemperature(
                      weather: weather,
                    ),
                  ],
                ),
              );
            }
            if (state is WeatherError) {
              return const Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_weatherBloc.dispose();
    super.dispose();
  }
}
