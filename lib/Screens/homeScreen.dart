import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../provider/weatherProvider.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/searchBar.dart' as s;
import '../widgets/weatherDetail.dart';
import '../widgets/5DayForecast.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData(context);
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(context, isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProv, _) {
            if (weatherProv.isRequestError) return RequestError();
            if (weatherProv.isLocationError) return LocationError();
            return Column(
              children: [
                s.SearchBar(),
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: ScrollingDotsEffect(activeStrokeWidth: 40,strokeWidth: 50,

                      activeDotColor: themeContext.primaryColor,
                      dotHeight: 20,
                      dotWidth: 20,
                    ),
                  ),
                ),
                _isLoading || weatherProv.isLoading
                    ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: themeContext.primaryColor,
                      color: Colors.white,
                    ),
                  ),
                )
                    : Expanded(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    children: [

                      RefreshIndicator(
                        onRefresh: () async => _refreshData(context),
                        child: ListView(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          children: [
                            MainWeather(),
                            WeatherDetail(),

                          ],
                        ),
                      ),

                      ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          FiveDayForecast(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
