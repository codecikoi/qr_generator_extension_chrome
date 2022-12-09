import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrCodePage();
  }
}

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late final TextEditingController _textController;
  late final FocusNode _textFocus;

  String qrText = '';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late SharedPreferences prefs;

  _asyncInitialization() async {
    prefs = await _prefs;
    qrText = prefs.getString('qrText') ?? '';
    return qrText;
  }

  @override
  void initState() {
    _asyncInitialization().then((result) {
      qrText = prefs.getString('qrText') ?? '';
      _textController = TextEditingController(text: qrText);
      _textFocus = FocusNode();
      setState(() {
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
