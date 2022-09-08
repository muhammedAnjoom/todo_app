import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/task%20helper/dataBase_helper.dart';
import 'package:todo_app/screen/home/widget/screen_task_card.dart';
import 'package:todo_app/screen/task/screen_task..dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  DatatBaseHelper _datatBaseHelper = DatatBaseHelper();
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(
                      "assets/images/log.jpg",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: const [],
                      future: _datatBaseHelper.getTasks(),
                      builder: ((context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return ScreenTaskPage(
                                        task: snapshot.data![index],
                                      );
                                    },
                                  ),
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: ScreenTaskCard(
                                title: snapshot.data![index].title,
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      Color(0xff7349fe),
                      Color(0xff643fdb),
                    ], begin: Alignment(0.0, -1.0), end: Alignment(0.0, 1.0)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ScreenTaskPage(
                            task: null,
                          ),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
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
