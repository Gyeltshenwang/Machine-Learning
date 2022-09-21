import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 39),
        title: Center(
            child: const Text(
          'About',
        )),
      ),
      body: Container(
        color: Color.fromARGB(255, 29, 29, 39),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Container(
                  color: Color.fromARGB(255, 29, 29, 39),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 29, 29, 39),
                    child: Column(children: [
                      Center(
                        child: Expanded(
                          child: Center(
                            child: Text(
                              "About app",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Expanded(
                      //   child: Text(
                      //     'KEWA DOCTOR, your assistant to treat potato leaf diseases.\n\nA project that was aimed to classify the disease of a potato leaf and suggests the treatment for a leaf disease.This project is developed by a team of students at GCIT and the app uses Google’s Tensorflow machine learning tool. It was implemented using image classification and deep learning. The app allows you to capture the imageof a leaf or upload from your device and classify.For more details please visit our website: Website[link]',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),

                      // Linkify(
                      //   onOpen: (link) {
                      //     print("Linkify link = ${link.url}");
                      //   },
                      //   text:
                      //       "Linkify click -  https://www.youtube.com/channel/UCwxiHP2Ryd-aR0SWKjYguxw",
                      //   style: TextStyle(color: Colors.blue),
                      //   linkStyle: TextStyle(color: Colors.green),
                      // ),
                      Text.rich(TextSpan(style: TextStyle(), children: [
                        TextSpan(
                            text:
                                "KEWA DOCTOR, your assistant to treat potato leaf diseases.\n A project that was aimed to classify the disease of a potato leaf and suggests the treatment for a leaf disease.This project is developed by a team of students at GCIT and the app uses Google’s Tensorflow machine learning tool. It was implemented using image classification and deep learning. The app allows you to capture the image of a leaf or upload from your device and classify.For more details please visit our website: ",
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                decoration: TextDecoration.underline),
                            //make link blue and underline
                            text: "https://kewadoctor.herokuapp.com",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String url = "https://kewadoctor.herokuapp.com";
                                var urllaunchable = await canLaunch(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  await launch(
                                      url); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              }),
                      ])),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
