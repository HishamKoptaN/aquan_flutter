// import 'package:flutter_test/flutter_test.dart';
// import 'package:device_frame/src/info/info.dart';
// import 'package:device_frame/src/devices/devices.dart';
// import 'package:integration_test_preview/integration_test_binding.dart';
// import 'package:aquan/main.dart' as app;
// import 'app_feature_groups.dart';

// void main() async {
//   const minutesPerDevice = 3;
//   final List<DeviceInfo> testDevices = [
//     Devices.ios.iPhone12,
//     Devices.android.samsungGalaxyNote20,
//     Devices.ios.iPadPro11Inches,
//   ];
//   final totalExpectedDuration =
//       Duration(minutes: testDevices.length * minutesPerDevice);
//   final binding = IntegrationTestPreviewBinding.ensureInitialized();

//   testWidgets('Testing end to end multi-screen integration',
//       (WidgetTester tester) async {
//     final main = app.setupMainWidget();

//     final integrationTestGroups = ScreenIntegrationTestGroups(binding);
//     await integrationTestGroups.initializeDevices(testDevices,
//         state: ScreenshotState.RESPONSIVE);
//     await integrationTestGroups.initializeTests(tester, main);
//   }, timeout: Timeout(totalExpectedDuration));
// }
