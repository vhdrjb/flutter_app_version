#import "AppVersionPlugin.h"
#if __has_include(<app_version/app_version-Swift.h>)
#import <app_version/app_version-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_version-Swift.h"
#endif

@implementation AppVersionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppVersionPlugin registerWithRegistrar:registrar];
}
@end
