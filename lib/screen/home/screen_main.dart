import 'package:flutter/material.dart';
import 'package:todo_app/screen/home/widget/screen_task_card.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: const Color(0xfff6f6f6),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Image(
                        width: 100,
                        height: 100,
                        image: AssetImage(
                          "assets/images/log.jpg",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ScreenTaskCard(
                        title: "Get Start!",
                        description:
                            "Hello Users! Welcome to WHAT_TODO app.this is a default task that you can edit or delete to start using the app.",
                      ),
                      ScreenTaskCard(),
                      ScreenTaskCard(),
                      ScreenTaskCard(),
                      ScreenTaskCard(),
                      ScreenTaskCard()
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff7349ef)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
