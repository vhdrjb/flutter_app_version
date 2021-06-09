import Flutter
import UIKit

public class SwiftAppVersionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ir.vhdrjb.channel/app_version", binaryMessenger: registrar.messenger())
    let instance = SwiftAppVersionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "getApplicationVersion" else {
      result(FlutterMethodNotImplemented)
      return
    }
    self.getAppVersion(result: result)
  }
    
    private func getAppVersion(result: FlutterResult) {
        let nsObject = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
       let version = nsObject as! String
        result(version)
      }
}
