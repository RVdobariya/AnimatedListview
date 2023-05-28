import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Auto Scroll ListView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double min1 = scrollController.position.minScrollExtent;
      double max1 = scrollController.position.maxScrollExtent;
      double min2 = scrollController1.position.minScrollExtent;
      double max2 = scrollController1.position.maxScrollExtent;
      double min3 = scrollController2.position.minScrollExtent;
      double max3 = scrollController2.position.maxScrollExtent;

      animateTo(scrollController, max1, 10, max1, min1);
      animateTo(scrollController1, max2, 15, max2, min2);
      animateTo(scrollController2, max3, 20, max3, min3);
    });

    // TODO: implement initState
    super.initState();
  }

  animateTo(ScrollController controller, double direction, int second,
      double max, double min) {
    controller
        .animateTo(direction,
            duration: Duration(seconds: second), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateTo(controller, direction, second, max, min);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        height: 50,
                        child: Text(
                          "${i}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollController1,
                  itemCount: 25,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        height: 50,
                        child: Text(
                          "${i}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollController2,
                  itemCount: 25,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        height: 50,
                        child: Text(
                          "${i}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
