import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List appScreens = [
    const Center(child: Text('Meal Plan')),
    const Center(child: Text('Recipes')),
    const Center(child: Text('Add New')),
    const Center(child: Text('Ingredients')),
    const Center(child: Text('List')),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_selectedIndex],
      appBar: AppBar(
        title: const Text('SupaBaseAuthCheck'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_rounded),
            label: 'Meal Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.egg),
            label: 'Ingredients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'List',
          ),
        ],
        selectedItemColor: Colors.red[900],
        backgroundColor: Colors.blueGrey[50],
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
      ),
    );
  }
}
