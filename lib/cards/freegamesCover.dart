import 'package:flutter/material.dart';

class FreeGamesCove extends StatefulWidget {
  final Map<String, String> freegames;

  const FreeGamesCove({Key? key, required this.freegames}) : super(key: key);

  @override
  State<FreeGamesCove> createState() => _FreeGamesCoveState();
}

class _FreeGamesCoveState extends State<FreeGamesCove> {
  late bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: 180,
          height: 300,
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  widget.freegames["asset"]!,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: 115,
                    padding: const EdgeInsets.all(8),
                    color: const Color.fromARGB(255, 73, 72, 72),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.freegames["title"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Lato",
                          ),
                        ),
                        Text(
                          widget.freegames["text"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 160, 157, 157),
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
