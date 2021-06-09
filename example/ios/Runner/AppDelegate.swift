import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let appVersionChannel = FlutterMethodChannel(name: "ir.vhdrjb.channel/app_version",
                                              binaryMessenger: controller.binaryMessenger)
    appVersionChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        guard call.method == "getApplicationVersion" else {
          result(FlutterMethodNotImplemented)
          return
        }
        self.getAppVersion(result: result)
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getAppVersion(result: FlutterResult) {
        let nsObject = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
       let version = nsObject as! String
        result(version)
      }
}
