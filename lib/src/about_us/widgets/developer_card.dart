import 'package:flutter/material.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({
    Key? key,
    required this.image,
    required this.name,
    required this.courseName,
  }) : super(key: key);

  final Image image;
  final String name;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorName.border,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 100,
                  backgroundImage: image.image,
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: VerticalDivider(
                color: ColorName.border,
                thickness: 2,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      courseName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
