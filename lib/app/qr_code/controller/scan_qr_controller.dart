import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQrController {
  Future<String?> scan() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      String? barcode = await scanner.scan();
      return barcode;
    } else {
      print("Camera permission denied");
      return null;
    }
  }
}
