import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:firebase/utils/color_utils.dart';
import 'package:firebase/reusable_widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _sound = "Press the button to start";
  bool _recording = false;
  late Stream<Map<dynamic, dynamic>> result;

  @override
  void initState() {
    super.initState();
    TfliteAudio.loadModel(
        model: 'assets/soundclassifier.tflite',
        label: 'assets/labels.txt',
        numThreads: 1,
        isAsset: true);
  }

  void _recorder() {
    String recognition = "";
    if (!_recording) {
      setState(() => _recording = true);
      result = TfliteAudio.startAudioRecognition(
        numOfInferences: 1,
        inputType: 'rawAudio',
        sampleRate: 16000,
        recordingLength: 15600,
        bufferSize: 2000,
      );
      result.listen((event) {
        recognition = event["recognitionResult"];
      }).onDone(() {
        setState(() {
          _recording = false;
          _sound = recognition.split(" ")[0];
        });
      });
    }
  }

  void _stop() {
    TfliteAudio.stopAudioRecognition();
    setState(() => _recording = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Check Your Heart Beat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            logoWidget("assets/images/logo.png"),
            MaterialButton(
              onPressed: _recorder,
              color: _recording ? Colors.grey : Colors.pink,
              textColor: Colors.white,
              child: Icon(Icons.mic, size: 60),
              shape: CircleBorder(),
              padding: EdgeInsets.all(25),
            ),
            Text(
              '$_sound',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            ElevatedButton(
              child: const Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Fluttertoast.showToast(msg: "Signed Out");
                  //print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
