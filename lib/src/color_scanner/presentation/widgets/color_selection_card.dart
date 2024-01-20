import 'package:flutter/material.dart';

class ColorSelectionCard extends StatelessWidget {
  const ColorSelectionCard({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.titleCard,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final IconData iconData;
  final String titleCard;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        elevation: 3,
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Icon(
                    iconData,
                    size: 95,
                    color: Colors.white,
                  ),
                ),
              ),
              const Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  titleCard,
                  style: themeContext.textTheme.headlineMedium?.apply(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
