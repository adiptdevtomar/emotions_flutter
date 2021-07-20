import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pie_chart/pie_chart.dart';

import 'models/models.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  bool isLoading = false;
  Emotion? details;
  final TextEditingController _textController = TextEditingController();
  final url = "http://0198dbdaf962.ngrok.io/api/getEmotion/";

  _getEmotionsApi() async {
    if (isLoading) return;
    final Map<dynamic, dynamic> reqData = {"text": _textController.text};
    try {
      var response = await Dio().post(url, data: reqData);
      setState(() {
        details = Emotion.fromJson(response.data["result"]);
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What's your mood today?",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _textController,
              maxLength: 3000,
            ),
            SizedBox(
              height: 50.0,
              child: (isLoading)
                  ? const CupertinoActivityIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _getEmotionsApi();
                        setState(() {
                          isLoading = true;
                          details = null;
                        });
                        FocusScope.of(context).unfocus();
                      },
                      child: const Text("Analyze!")),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: (details != null)
                    ? PieChart(dataMap: details!.toJson())
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
