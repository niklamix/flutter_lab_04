import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWidget extends StatefulWidget {
  @override
  createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  var text = 'Это моё приложение на Flutter!';

  void _changeText() {
    setState(() {
      if (text == 'Это моё приложение на Flutter!') {
        text = 'Это котик!';
      } else {
        text = 'Это моё приложение на Flutter!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(padding: EdgeInsets.only(top: 30, bottom:0, left:0, right:0)),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$text'),
            ]
        ),
        //Spacer(),
        //const Padding(padding: EdgeInsets.only(top: 30, bottom:0, left:0, right:0)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  followTheLink('https://github.com/niklamix/flutter_lab_01');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
                    Colors.white60)),
                child: const Text('ссылка на гит',
                    style: TextStyle(color: Colors.black)),
              )
            ]
        ),
        //Spacer(flex:3),
        //const Padding(padding: EdgeInsets.only(top: 30, bottom:0, left:0, right:0)),
        Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  followTheLink('https://smolgu.ru');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
                    Colors.white60)),
                child: const Text('перейти на сайт смолГУ!',
                    style: TextStyle(color: Colors.black)),
              ),
            ]
        ),
        //Spacer(flex:9),
        //const Padding(padding: EdgeInsets.only(top: 0, bottom: 42, left:0, right:0)),
        SizedBox(
            height: 542,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 0, bottom: 42, left:0, right:0)),
                  IconButton(
                    onPressed: _changeText,
                    iconSize: 400,
                    icon: Image.asset("assets/images/masterCat.jpg"),
                  ),
                ]
            )
        ),
      ],
    );
  }
}

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: MyWidget()
          ),
        ),
      ),
  );
}

void followTheLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
