import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      
      PigeonApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: MyAPI())
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class MyAPI: PigeonApi {
    func testMessage(fromFlutter: String) throws -> Response {
        return Response(response: "\(fromFlutter) call IOS")
    }
}
