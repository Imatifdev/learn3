import 'package:flutter/material.dart';
import 'package:learn3/view/NavPages/earn.dart';
import 'package:learn3/view/NavPages/explore.dart';
import 'package:learn3/view/NavPages/learn.dart';
import 'package:learn3/view/NavPages/return.dart';
import 'package:learn3/view/NavPages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      print('Tapped on index: $index');
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          Explore(),
          Learnn(),
          Earn(),
          Returnn(),
          Wallett(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF8F8F8),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF3e8da8),
        unselectedItemColor:
            Color(0xFFa6b8ca), // Color for unselected items (icon + label)
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 30),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on, size: 30),
            label: 'Earn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, size: 30),
            label: 'Return',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet, size: 30),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
