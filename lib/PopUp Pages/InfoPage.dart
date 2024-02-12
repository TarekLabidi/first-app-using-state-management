import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final Map<String, String> gameInfos;
  const InfoPage({super.key, required this.gameInfos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Game Informations",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 1),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/gaming.jpg"),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                gameInfos["asset"]!,
                width: 330,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              gameInfos["name"]!,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Text(
              "Dropping Soon, Be Ready!!!!",
              style: TextStyle(
                fontFamily: AutofillHints.birthdayMonth,
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 204, 40, 40),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 88, 87, 87),
                      Color.fromARGB(255, 51, 50, 50),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                height: 300 - 37 - 19.57 - 0.00143,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gameInfos["title"]!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 226, 222, 222),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        gameInfos["text"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 169, 165, 165),
                          fontWeight: FontWeight.w300,
                          fontFamily: "Lato",
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
