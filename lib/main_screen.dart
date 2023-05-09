import 'package:flutter/material.dart';
import 'package:movieapp/movie_list_widget/movie_list_widget.dart';

class MainscreenWidget extends StatefulWidget {
  const MainscreenWidget({super.key});

  @override
  State<MainscreenWidget> createState() => _MainscreenWidgetState();
}

class _MainscreenWidgetState extends State<MainscreenWidget> {
  int _selectedTab = 0;
  
  void onSelectedTab(int index) {
    setState(() {
      if (_selectedTab == index) return;
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            'Netflix',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red[800],
            ),
          ),
        ),
),
      
      body: 
      IndexedStack(
        index:_selectedTab,
        children: [
 Text(
      'News',
    ),
    MovieListWidget(),

    Text(
      'Series',
    ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_rounded),
              label: 'Films',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv_rounded),
              label: 'Series',
            ),
          ],
          onTap: onSelectedTab),
    );
  }
}
