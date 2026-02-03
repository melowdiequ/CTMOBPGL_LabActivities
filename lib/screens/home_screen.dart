import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/custom_font.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName; 
  const HomeScreen({super.key, required this.userName}); 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'melowdiequ',    
      'Friends',        
      'Notifications',  
      widget.userName, 
    ];

    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: CustomFont(
          text: titles[_selectedIndex], // Updated to use local titles list
          fontSize: ScreenUtil().setSp(25),
          color: FB_PRIMARY,
          fontFamily: 'Klavika',
          maxLines: 1,
        ),
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
     
        children: [
          const NewsFeedScreen(),       
          const Center(child: Text('People Screen')), 
          const NotificationScreen(),   
          ProfileScreen(userName: widget.userName), // Fixed: Passed the required userName
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTappedBar,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: FB_PRIMARY,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            activeIcon: Icon(Icons.group),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}