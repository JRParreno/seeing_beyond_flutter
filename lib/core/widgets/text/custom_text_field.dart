import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.decoration,
    this.hintText,
  });

  final InputDecoration? decoration;
  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF34343D),
          borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 25,
            color: const ColorScheme.dark().outline.withOpacity(0.5),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: controller,
              autocorrect: false,
              decoration: decoration ??
                  (const InputDecoration())
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                        hintText: hintText,
                        contentPadding: const EdgeInsets.only(bottom: -2),
                        isDense: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          color:
                              const ColorScheme.dark().outline.withOpacity(0.5),
                        ),
                      ),
            ),
          )
        ],
      ),
    );
  }
}
