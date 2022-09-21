//import 'package:classification/DiseaseType.dart';
//import 'package:classification/Home.dart';

import 'package:classification/About.dart';
import 'package:classification/DiseaseType.dart';
import 'package:classification/Home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 29, 29, 39)),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 29, 29, 39),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: ListTile(
                    // leading: CircleAvatar(
                    //   backgroundImage: AssetImage(
                    //     "assets/images/logo.png",
                    //   ),
                    // ),
                    leading: Image.asset(
                      'assets/images/logo.png',
                    ),
                    //

                    title: Text(
                      'Kewa Doctor',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  //Navigator.of(context).push();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.vaccines_rounded,
                  color: Colors.white,
                ),
                title: Text('Disease Types',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DiseaseType()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.accessibility,
                  color: Colors.white,
                ),
                title: Text('About', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                },
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 29, 29, 39),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 40,
                  width: 200,
                  color: Color.fromARGB(255, 29, 29, 39),
                  child: Center(
                    child: Text(' W E L C O M E',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Image.asset(
                  'assets/images/slider.jpg',
                  fit: BoxFit.cover,
                ),
                color: Color.fromARGB(255, 52, 52, 171),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.1,
                color: Color.fromARGB(255, 29, 29, 39),
                child: Column(children: [
                  Expanded(
                    child: Text(
                      "There are many diseases that affect potato tubers, so as you sort through your potato harvest each year, take a moment to check for disease symptoms. Proper identification will help you decide which tubers will store well and which should be sold as tablestock, and will give you a better idea of which soil-borne diseases are present in your fields, improving your future crop rotations.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Classify Diseases',
                      style: TextStyle(color: Colors.grey),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
