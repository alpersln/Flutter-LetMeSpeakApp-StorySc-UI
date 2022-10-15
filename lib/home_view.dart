import 'package:flutter/material.dart';
import 'package:flutter_letmespeakapp_story_ui/view/grammar_view/grammer_view.dart';
import 'package:flutter_letmespeakapp_story_ui/view/profile_view/profile_view.dart';
import 'package:flutter_letmespeakapp_story_ui/view/story_view/story_view.dart';
import 'package:flutter_letmespeakapp_story_ui/view/words_view/words_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedItem = 0;
  void tabChanger(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List<Widget> tabbarScreens = [
    const StoryView(),
    const WordsView(),
    const GrammerView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabbarScreens[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        onTap: tabChanger,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                size: 28,
              ),
              label: "Hikaye"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.backpack_outlined,
                size: 28,
              ),
              label: "Kelimeler"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school_outlined,
                size: 28,
              ),
              label: "Dil Bilgisi"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 28,
              ),
              label: "Profil"),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
