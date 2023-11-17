import 'package:eduhub_mobile/util/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:eduhub_mobile/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          NavigationUtil.onItemTapped(context, index);
        },
      ),
    );
  }
}
