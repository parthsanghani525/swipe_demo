import 'package:flutter/material.dart';
import 'package:image_swipe_demo/utility/constant/string_constant.dart';

import 'widget/cardstack_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Icon(
              Icons.menu,
              color: Colors.grey,
              size: 28,
            ),
            Icon(
              Icons.keyboard_return,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
        title: const Text(
          AppString.appTitle,
          style: TextStyle(color: Color(0xffF7D060), fontSize: 26),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.timer,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.filter,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const CardStackWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 30,
            ),
            label: '',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
