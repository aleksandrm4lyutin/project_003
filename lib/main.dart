import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:project_003/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(InitApp());
}


class InitApp extends StatelessWidget {
  InitApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //Check for errors
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('ERROR WHILE INITIALIZING'),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return OneSignalApp();
        }

        ///Show something while waiting for initialization to complete
        return const MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              ///TODO
            ),
          ),
        );
      },
    );
  }
}


Future<String?> loadRemCon() async {
  /// Set up remote config
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 0),
    minimumFetchInterval: const Duration(hours: 0),
  ));
  await remoteConfig.setDefaults(const {"SERVICE_OS_KEY": ''});
  /// Get remote config from firebase
  try {
    await remoteConfig.fetchAndActivate();
    remoteConfig.ensureInitialized();
    String link = remoteConfig.getString("SERVICE_OS_KEY");
    return link;
  } catch (e) {
    print('>>>>>>>>>> Error $e <<<<<<<<<<<');
    return null;
  }
}

class OneSignalApp extends StatelessWidget {
  OneSignalApp({super.key});

  final Future<String?> _onesignal = loadRemCon();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: Future.wait([_initialization, _onesignal]),
      future: _onesignal,
      builder: (context, snapshot) {
        //Check for errors
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('ERROR WHILE FETCHING REMOTE CONFIG FOR ONESIGNAL'),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data;
          String oneSignalID = '';
          if(data != null) {
            oneSignalID = data;
            print('--#@#@#@#@ oneSignalID: $oneSignalID--');
          }
          //Remove this method to stop OneSignal Debugging
          OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
          OneSignal.shared.setAppId(oneSignalID);
          // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
          OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
            print("Accepted permission: $accepted");
          });

          return const MyApp();
        }

        ///Show something while waiting for initialization to complete
        return const MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              ///TODO
            ),
          ),
        );
      },
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}