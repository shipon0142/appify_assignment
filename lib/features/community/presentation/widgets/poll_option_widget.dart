import 'package:flutter/material.dart';

class PollOptionWidget extends StatelessWidget {
  final String pollOption;
  final IconData icon;

  const PollOptionWidget({
    super.key,
    required this.pollOption,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFC3C9E0),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14,14,0,14),
              child: Row(
                children: [
                  ColoredBox(
                    color: Colors.black,
                    child: SizedBox(
                      height: 22,
                      width: 1,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    pollOption,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: (){},
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ],
    );
  }
}
