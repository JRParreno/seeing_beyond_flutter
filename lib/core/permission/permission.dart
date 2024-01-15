import 'package:permission_handler/permission_handler.dart';

Future<void> listenForPermissions() async {
  final status = await Permission.microphone.status;
  switch (status) {
    case PermissionStatus.denied:
      requestForPermission();
      break;
    case PermissionStatus.granted:
      break;
    case PermissionStatus.limited:
      break;
    case PermissionStatus.permanentlyDenied:
      break;
    case PermissionStatus.restricted:
      break;

    default:
      PermissionStatus.restricted;
      break;
  }
}

Future<void> requestForPermission() async {
  await Permission.microphone.request();
}
