import 'package:flutter/material.dart';
import 'package:flutter_application_test/screens/home/home_screen.dart';
import 'package:flutter_application_test/screens/profile/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

int currentIndex = 0;

List pages = const [HomeScreen(), ProfileScreen()];

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: currentIndex == 1
                    ? Colors.white
                    : const Color.fromARGB(138, 255, 255, 255),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/me.JPG'),
                ),
              ),
              label: 'Profile'),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
