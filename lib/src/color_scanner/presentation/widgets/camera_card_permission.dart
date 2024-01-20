import 'package:flutter/material.dart';

class CameraCardPermission extends StatelessWidget {
  const CameraCardPermission({
    Key? key,
    required this.tapEnablePermission,
  }) : super(key: key);

  final VoidCallback tapEnablePermission;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          tapEnablePermission();
        },
        child: const Card(
          margin: EdgeInsets.only(
            top: 20,
          ),
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ' Tap this to enable camera.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
