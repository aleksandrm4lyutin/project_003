package test.app.june2023

import io.flutter.embedding.android.FlutterActivity
import com.onesignal.OneSignal

class MainActivity: FlutterActivity() {

    private fun initOneSignal(onesignalAppId: String) {
        // Инициализация OneSignal
        OneSignal.setLogLevel(OneSignal.LOG_LEVEL.VERBOSE, OneSignal.LOG_LEVEL.NONE)
        OneSignal.initWithContext(this)
        OneSignal.setAppId("SERVICE_OS_KEY")
        OneSignal.promptForPushNotifications()
    }
}

