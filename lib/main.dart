import 'package:madura_app/data/repositories/authentication/user/authentication_repository.dart';
import 'package:madura_app/data/repositories/authentication/user/authentication_repository.dart';
import 'package:madura_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'app.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  // Add Widget Binding 
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize WebView
  WebViewPlatform.instance;

  // Cloudinary
  await dotenv.load(fileName: ".env");

  // GetX Local Storage
  await GetStorage.init();

  // Await Native Splash hingga item lain ke load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  // Cloudinary
  


  runApp(const App());
}
