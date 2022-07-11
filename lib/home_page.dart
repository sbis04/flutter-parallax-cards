import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parallax_cards/res/palette.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final foregroundImages = ['rio.png', 'france.png', 'iceland.png'];
  final backgroundImages = ['rio-bg.jpg', 'france-bg.jpg', 'iceland-bg.jpg'];
  final text = ['Brazil', 'France', 'Iceland'];

  int _selectedIndex = 0;
  double? _accelerometerXAxis;
  late final StreamSubscription<dynamic> _streamSubscription;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _streamSubscription = accelerometerEvents.listen(
      (AccelerometerEvent event) {
        setState(() {
          _accelerometerXAxis = event.x;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_outline,
              size: 30,
            ),
          )
        ],
      ),
      backgroundColor: Palette.grayBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(),
          const SizedBox(height: 16),
          const Text(
            'Exclusive trips just for you',
            style: TextStyle(
              fontFamily: 'GabrielaStencil',
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24),
          CarouselSlider(
            options: CarouselOptions(
              height: 520.0,
              viewportFraction: 0.80,
              enableInfiniteScroll: false,
            ),
            items: foregroundImages.asMap().entries.map((entry) {
              int index = entry.key;
              String foregroundImage = entry.value;

              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            right: _accelerometerXAxis != null
                                ? (-350 + _accelerometerXAxis! * 30)
                                : -350,
                            child: Image.asset(
                              'images/${backgroundImages[index]}',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            width: 320,
                            bottom: -60,
                            right: _accelerometerXAxis != null
                                ? (-13 + _accelerometerXAxis! * 1.5)
                                : -13,
                            child: Image.asset(
                              'images/$foregroundImage',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 60),
                              const Text(
                                'FEATURED',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                text[index],
                                style: const TextStyle(
                                  fontFamily: 'GabrielaStencil',
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0, primary: Colors.white30),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  child: Text(
                                    'EXPLORE',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'OTHER OFFERS',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Palette.grayBackground,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}
