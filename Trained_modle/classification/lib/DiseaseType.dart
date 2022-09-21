import 'package:flutter/material.dart';

class DiseaseType extends StatefulWidget {
  const DiseaseType({Key? key}) : super(key: key);

  @override
  State<DiseaseType> createState() => _DiseaseTypeState();
}

class _DiseaseTypeState extends State<DiseaseType> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 29, 39),
          title: Center(
              child: const Text(
            'Type of Diseases',
          )),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 29, 29, 39),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/Early.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2666,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(255, 29, 29, 39),
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Early Blight',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            "Early Blight\nIt is caused by the fungus Alternaria solani. It is found wherever potatoes are grown.\n\nTreatment\n1. planting potato varieties that are resistant to the disease; late maturing are more resistant than early maturing varieties.\n2. Avoid overhead irrigation and allow for sufficient aeration between plants to allow the foliage to dry as quickly as possible.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2233,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/late_slider.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2555,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(255, 29, 29, 39),
                      child: Column(children: [
                        Center(
                            child: Text(
                          'Late Blight',
                          style: TextStyle(color: Colors.white),
                        )),
                        Divider(
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            "It is caused by the funguslike oomycete pathogen Phytophthora infestans. This potentially devastating disease can infect potato foliage and tubers at any stage of crop development.\n\nTreatment\nlate Blight is controlled by eliminating cull piles and volunteer potatoes, using proper harvesting and storage practices, and applying fungicideswhen necessary. Air drainage to facilitate the drying of foliage each day is important.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
