import Cocoa
import FlutterMacOS


class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> NSView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

public func createLabel() -> NSTextField {
    let nativeLabel = NSTextField()
    nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
    nativeLabel.stringValue = "Native text from macOS"
    nativeLabel.textColor = NSColor.red
    nativeLabel.isBezeled = false
    nativeLabel.isEditable = false
    nativeLabel.sizeToFit()
    return nativeLabel
}

class FLNativeView: NSView {

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        super.init(frame: frame)
        super.wantsLayer = true
        super.layer?.backgroundColor = NSColor.blue.cgColor
        super.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        super.addSubview(createLabel())
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        super.wantsLayer = true
        super.layer?.backgroundColor = NSColor.blue.cgColor
        super.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        super.addSubview(createLabel())
    }
}


public class FlutterMacosPlatformViewExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_macos_platform_view_example", binaryMessenger: registrar.messenger)
    let instance = FlutterMacosPlatformViewExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    let factory = FLNativeViewFactory(messenger: registrar.messenger)
    registrar.register(factory, withId: "@views/simple-box-view-type")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
