import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morse Code Decoder'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Morse Code',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                setState(() {
                  convertMorseCode();
                });
              },
            ),
            const SizedBox(height: 26),
            Text(
              'Decoded String',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 10),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
              ),
              alignment: Alignment.center,
              child: Text(
                decodedString,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  String decodedString = '';

  String convertMorseCode() {
    decodedString = '';

    String morseCodeString = _controller.text.trim();

    List<String> letters = morseCodeString.split(' ');

    for (String letter in letters) {
      String decodedWord = '';

      decodedWord += morseCodeMap[letter] ?? '';

      decodedString += '$decodedWord ';
    }

    return decodedString.trim();
  }
}

Map<String, String> morseCodeMap = {
  '/': ' ',
  '.-': 'A',
  '-...': 'B',
  '-.-.': 'C',
  '-..': 'D',
  '.': 'E',
  '..-.': 'F',
  '--.': 'G',
  '....': 'H',
  '..': 'I',
  '.---': 'J',
  '-.-': 'K',
  '.-..': 'L',
  '--': 'M',
  '-.': 'N',
  '---': 'O',
  '.--.': 'P',
  '--.-': 'Q',
  '.-.': 'R',
  '...': 'S',
  '-': 'T',
  '..-': 'U',
  '...-': 'V',
  '.--': 'W',
  '-..-': 'X',
  '-.--': 'Y',
  '--..': 'Z',
  '.----': '1',
  '..---': '2',
  '...--': '3',
  '....-': '4',
  '.....': '5',
  '-....': '6',
  '--...': '7',
  '---..': '8',
  '----.': '9',
  '-----': '0'
};
