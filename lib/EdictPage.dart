import 'package:flutter/material.dart';

class EditCVPage extends StatefulWidget {
  final String fullName;
  final String slackUsername;
  final String githubHandle;
  final String personalBio;
  const EditCVPage(
      this.fullName, this.slackUsername, this.githubHandle, this.personalBio,
      

      );

  @override
  State<EditCVPage> createState() => _EditCVPageState();
}

class _EditCVPageState extends State<EditCVPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController personalBioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.fullName;
    slackUsernameController.text = widget.slackUsername;
    githubHandleController.text = widget.githubHandle;
    personalBioController.text = widget.personalBio;
  }

  Widget _buildEditBody(TextEditingController controller, String title) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildMultilineTextFieldBody(
      TextEditingController controller, String title) {
    return TextField(
      controller: controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Edit CV",
         style: TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              _buildEditBody(fullNameController, "Full Name"),
              const SizedBox(
                height: 30.0,
              ),
              _buildEditBody(slackUsernameController, "Slack Username"),
              const SizedBox(
                height: 30.0,
              ),
              _buildEditBody(githubHandleController, "GitHub Handle"),
              const SizedBox(
                height: 30.0,
              ),
              _buildMultilineTextFieldBody(personalBioController, "Bio"),
             const SizedBox(
              height: 30,
             ),
              ElevatedButton(
                onPressed: () {
                  final updatedData = {
                    'fullName': fullNameController.text,
                    'slackUsername': slackUsernameController.text,
                    'githubHandle': githubHandleController.text,
                    'bio': personalBioController.text,
                  };
                  Navigator.pop(context, updatedData);
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.black, // Button color
                  
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                   fontSize: 15.0,
                      fontFamily: "QuickSand",
                      color: Colors.white,
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}