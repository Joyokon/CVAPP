import 'EdictPage.dart';

import 'package:flutter/material.dart';

class CvWiew extends StatefulWidget {

  //const CvWiew({super.key});

  @override
  State<CvWiew> createState() => _CvWiewState();
}

class _CvWiewState extends State<CvWiew> {
  String fullName = "OKon Joy Ndifreke";
  String slackUsername = "Joy Okon";
  String githubHandle = "joy okon";
  String personalBio =
      "I am a Flutter developer and a graduate of university of uyo, Akwa ibom state,"
       ' Nigeria'
      ' I am fueled by passion and unwavering motivation to excel in the dynamic '
      'realm of mobile app development. My journey is marked by a relentless pursuit '
      'of knowledge and personal growth.My aspiration is to harness my skills and '
      'unleash my creativity in the development of cutting-edge, user-friendly '
      'cross-platform applications. I am unwaveringly committed to keeping pace '
      ' with the ever-evolving Flutter landscape,with staying attuned to the latest '
      'trends, and embracing best practices. As I continue to expand my expertise,'
      'I am excited to make my mark in this exhilarating field.';

  Widget bodyBuild(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(

              fontSize: 25.0,
              fontFamily: "Opensans",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: "QuickSand",
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToEditPage(BuildContext context) async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditCVPage(fullName, slackUsername, githubHandle, personalBio),
      ),
    );

    if (updatedData != null) {
      setState(() {
        fullName = updatedData['fullName'] ?? fullName;
        slackUsername = updatedData['slackUsername'] ?? slackUsername;
        githubHandle = updatedData['githubHandle'] ?? githubHandle;
        personalBio = updatedData['bio'] ?? personalBio;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "HNGx CV APP",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "OpenSans",
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            bodyBuild('Full Name', fullName),
            const Divider(),
            bodyBuild("Slack Username", slackUsername),
            const Divider(),
            bodyBuild('GitHub Handle', githubHandle),
            const Divider(),
            bodyBuild('Bio', personalBio),
            const Spacer(),
            ElevatedButton(
                onPressed: () => _navigateToEditPage(context),
                style:
                    ElevatedButton.styleFrom(
                      primary: Colors.black),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    Text(
                      'Edit CV',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: "QuickSand",
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 20.0,
            )
          ],
        ));
  }
}