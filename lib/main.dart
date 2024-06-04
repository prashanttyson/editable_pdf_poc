import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

const String DOCUMENT_PATH = 'pdfs/fillable.pdf';

void main() {
  // Pspdfkit.setLicenseKey('null');
  runApp(MyApp());}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void initPlatformState() async {
    // By default, this example doesn't set a license key, but instead runs in trial mode (which is the default, and which requires no
    // specific initialization). If you want to use a different license key for evaluation (e.g. a production license), you can uncomment
    // the next line and set the license key.
    //
    // To set the license key for both platforms, use:
    // await Pspdfkit.setLicenseKeys("YOUR_FLUTTER_ANDROID_LICENSE_KEY_GOES_HERE", "YOUR_FLUTTER_IOS_LICENSE_KEY_GOES_HERE");
    //
    // To set the license key for the currently running platform, use:
    // await Pspdfkit.setLicenseKey("YOUR_FLUTTER_LICENSE_KEY_GOES_HERE");
  }

  Future<String> extractAsset(BuildContext context, String assetPath) async {
    if (kIsWeb) {
      return assetPath;
    }
    final bytes = await DefaultAssetBundle.of(context).load(assetPath);
    final list = bytes.buffer.asUint8List();
    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$assetPath';
    final file = File(tempDocumentPath);
    await file.create(recursive: true);
    file.writeAsBytesSync(list);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder<String>(
              future: extractAsset(context, DOCUMENT_PATH),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  /// PspdfkitWidget is a widget that displays a PDF document.
                  return PspdfkitWidget(
                    documentPath: snapshot.data!,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}