import 'package:ecommerce_app/features/account/presentation/pages/account_page.dart';
import 'package:ecommerce_app/features/product/presentation/widgets/app_bar_widget.dart';
import 'package:ecommerce_app/features/support/presentation/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';

/// The main page of the application with bottom navigation.
///
/// The [MainPage] provides navigation between the home, search, account,
/// and support pages using a [BottomNavigationBar].
class MainPage extends StatefulWidget {
  /// Creates an instance of [MainPage].
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// The index of the currently selected page.
  int _selectedIndex = 0;

  /// The list of pages to display based on the selected index.
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const AccountPage(),
    const SupportPage(),
  ];

  /// Handles item tap events on the [BottomNavigationBar].
  ///
  /// Sets the selected index to the tapped item's index and updates the state.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Los Recuerdos De Ella',
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cuenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Soporte',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
