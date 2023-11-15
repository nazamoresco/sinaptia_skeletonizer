import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeletonizer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF76FBE4),
          brightness: Brightness.dark,
        ),
      ),
      home: const SkeletonizerDemoPage(),
    );
  }
}

class SkeletonizerDemoPage extends StatefulWidget {
  const SkeletonizerDemoPage({super.key});

  @override
  State<SkeletonizerDemoPage> createState() => _SkeletonizerDemoPageState();
}

class _SkeletonizerDemoPageState extends State<SkeletonizerDemoPage> {
  bool _enabled = true;

  static const blogs = [
    {
      "title": "Long-awaited comparison validator comes to Rails 7",
      "subtitle":
          "For years we had to manually compare values in our validations. Rails 7 added the comparison validator to ActiveModel. Read on and discover, as we just did, how it works.",
    },
    {
      "title": "Is Ruby on Rails secure?",
      "subtitle":
          "This is one of the most frequently asked questions from people who want to build an MVP with Ruby on Rails.",
    },
    {
      "title": "I want to finish it quickly",
      "subtitle":
          "Anxiety and lack of experience make junior developers want to finish their tasks quickly to prove that they can handle them.",
    },
    {
      "title": "Function Currying: A real-life use example",
      "subtitle":
          "Moving your functions from a component to a separate file can improve readability and organization, but what happens when the data you need is outside the scope? In this article I will show you how I solved this problem with function currying.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: SvgPicture.asset(
              'assets/wave1.svg',
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.height,
              height: 500,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: SvgPicture.asset(
                "assets/sinaptia.svg",
                height: 64,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 64,
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 0, right: 16),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: FloatingActionButton(
                  child: Icon(
                    _enabled
                        ? Icons.hourglass_bottom_rounded
                        : Icons.hourglass_disabled_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _enabled = !_enabled;
                    });
                  },
                ),
              ),
            ),
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Skeletonizer(
                  enabled: _enabled,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(blogs[index]["title"]!),
                          subtitle: Text(blogs[index]["subtitle"]!),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
