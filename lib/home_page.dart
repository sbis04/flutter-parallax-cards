import 'package:flutter/material.dart';
import 'package:flutter_parallax_cards/travel_cards.dart';
import 'package:flutter_parallax_cards/res/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final foregroundImages = ['rio.png', 'france.png', 'iceland.png'];
  final backgroundImages = ['rio-bg.jpg', 'france-bg.jpg', 'iceland-bg.jpg'];
  final texts = ['Brazil', 'France', 'Iceland'];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          TravelCards(
            foregroundImages: foregroundImages,
            backgroundImages: backgroundImages,
            texts: texts,
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
