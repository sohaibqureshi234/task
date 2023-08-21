// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:task_prismware/models/weather.dart';
// import 'package:task_prismware/provider/weatherProvider.dart';
// import 'package:task_prismware/widgets/mainWeather.dart';
// void main() {
//   group('MainWeather Widget', () {
//     testWidgets('Should display weather information', (WidgetTester tester) async {
//       final weatherProvider = WeatherProvider();
//       weatherProvider.weather = Weather(
//         temp: 25.0,
//         tempMax: 30.0,
//         tempMin: 20.0,
//         lat: 40.7128,
//         long: -74.0060,
//         feelsLike: 26.0,
//         pressure: 1013,
//         description: 'Clear Sky',
//         currently: 'Clear',
//         humidity: 70,
//         windSpeed: 5.0,
//         cityName: 'City Name',
//       );
//
//       await tester.pumpWidget(
//         MaterialApp(
//           home: ChangeNotifierProvider.value(
//             value: weatherProvider,
//             child: MainWeather(),
//           ),
//         ),
//       );
//
//       expect(find.text('City Name'), findsOneWidget);
//       expect(find.text(DateFormat.yMMMEd().add_jm().format(DateTime.now())), findsOneWidget);
//       expect(find.text('25°C'), findsOneWidget);
//       expect(find.text('30°/ 20° Feels like 26°'), findsOneWidget);
//       expect(find.text('Clear'), findsOneWidget);
//       expect(find.text('Clear Sky'), findsOneWidget);
//     });
//   });
// }
