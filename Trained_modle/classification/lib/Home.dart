import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';
import 'package:tflite/tflite.dart'; // for saving image

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageURI;

  List? _result;

  String _confidence = "";
  String _name = "";

  String numbers = '';

  // get image from source
  Future getImage(ImageSource source) async {
    // Try catch
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemporary = File(image.path);

      // final imagePermanent = await saveFilePermanently(image.path); //for saving

      setState(() {
        this.imageURI = imageTemporary;
        // this.imageURI = imagePermanent; // for saving

        applyModelOnImage(imageURI!);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // // To save image to application folder
  // Future<File> saveFilePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');

  //   return File(imagePath).copy(image.path);
  // }

  // to load model
  loadModel() async {
    var resultant = await Tflite.loadModel(
        labels: "assets/model/labels.txt", model: "assets/model/model.tflite");

    print("Resultant after loading model: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 4,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _result = res;

      String str = _result![0]["label"];
      print(str);

      _name = str.substring(2);
      print(_name);
      // if (_name == 'Late Blight') {
      //   _confidence = _result != null
      //       ? (_result![0]['confidence'] * 100.0).toString().substring(0, 5) +
      //           "%"
      //       : "";
      //   print('is it working');
      //   lateblight();
      // } else if (_name == 'Early Blight') {
      //   _confidence = _result != null
      //       ? (_result![0]['confidence'] * 100.0).toString().substring(0, 5) +
      //           "%"
      //       : "";
      //   print('is it working');
      // }

      print(_result);
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 39),
        title: Center(
            child: Center(
          child: const Text(
            'Classify Diseases',
          ),
        )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 29, 29, 39),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            imageURI != null
                ? Image.file(
                    imageURI!,
                    width: 256,
                    height: 256,
                    fit: BoxFit.cover,
                  )
                // :
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Color.fromARGB(255, 29, 29, 39),
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "$_name \n",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            _name == 'Late Blight' ? lateblight() : Container(),
            _name == 'Early Blight' ? early() : Container(),
            _name == 'Unknown'
                ? Container(
                    child: Text(
                    'Sorry! could not recognize',
                    style: TextStyle(color: Colors.white),
                  ))
                : Container(),
            _name == 'Healthy' ? healthy() : Container()
          ],
        )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            child: Icon(
              Icons.camera,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            focusColor: Color.fromARGB(255, 38, 34, 34),
            foregroundColor: Colors.blue,
            hoverColor: Color.fromARGB(255, 128, 243, 132),
            splashColor: Colors.tealAccent,
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: Icon(
              Icons.photo_album,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            focusColor: Color.fromARGB(255, 38, 34, 34),
            foregroundColor: Colors.blue,
            hoverColor: Color.fromARGB(255, 128, 243, 132),
            splashColor: Colors.tealAccent,
          )
        ],
      ),
    );
  }

  Container early() {
    return Container(
        height: MediaQuery.of(context).size.height / 3.6,
        width: MediaQuery.of(context).size.width * .9,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 9,
                  color: Color.fromARGB(255, 29, 29, 39),
                  child: Column(children: [
                    Divider(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        "Early Blight is caused by the fungus Alternaria solani. It is found wherever potatoes are grown.\n\nTreatment\n1. planting potato varieties that are resistant to the disease; late maturing are more resistant than early maturing varieties.\n2. Avoid overhead irrigation and allow for sufficient aeration between plants to allow the foliage to dry as quickly as possible.\n3.Providing adequate nutrition and sufficient irrigation,especially later in the growing season after flowering when plants are most susceptible to the disease.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ));
  }

  healthy() {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width * .9,
        //color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .9,
                  color: Color.fromARGB(255, 29, 29, 39),
                  child: Column(children: [
                    Expanded(
                      child: Text(
                        "Thats great, Your plant is Healty.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}

class lateblight extends StatelessWidget {
  const lateblight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width * .9,
        //color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .9,
                  color: Color.fromARGB(255, 29, 29, 39),
                  child: Column(children: [
                    Divider(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        "Late Blight is caused by the funguslike oomycete pathogen Phytophthora infestans. This potentially devastating disease can infect potato foliage and tubers at any stage of crop development.\n\nTreatment\nlate Blight is controlled by eliminating cull piles and volunteer potatoes, using proper harvesting and storage practices, and applying fungicideswhen necessary. Air drainage to facilitate the drying of foliage each day is important.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}
