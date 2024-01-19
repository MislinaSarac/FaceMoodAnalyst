import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/Screens/Calender/calender_view.dart';
import 'package:flutter_face_detection/ui/Screens/login/login_view.dart';
import 'package:flutter_face_detection/ui/Screens/scan/scan_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 68,
        title: const Text(
          'EmojiGoo ',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellowAccent.shade700,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('LOGOUT'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            child: Text(
              'Welcome; ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.amber.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            //color: Colors.yellowAccent[700],
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScanView()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'What\'s up',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ' ' + 'Let\'s look at the mood',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.snapchat,
                      size: 40,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalenderView()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Came Onn,',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ' ' + 'Let\'s choose our mode',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.question_mark_sharp,
                      size: 35,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Emotion',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(emojis.length, (index) {
                final emoji = emojis[index];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                emoji.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                emoji.description,
                                style: const TextStyle(
                                    fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          emoji.imagePath,
                          height: 75,
                          width: 75,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          emoji.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class Emoji {
  final String title;
  final String description;
  final String imagePath;

  Emoji({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<Emoji> emojis = [
  Emoji(
    title: 'Smile ',
    description:
        'Form one\'s features into a pleased, kind, or amused expression,' +
            'typically with the corners of the mouth turned up and the front teeth exposed.' +
            '\n They are happy :)',
    imagePath: 'assets/images/smile.png',
  ),
  Emoji(
    title: 'Angry ',
    description:
        'Feeling or showing strong annoyance, displeasure, or hostility; full of anger.' +
            '\n They are angry...',
    imagePath: 'assets/images/angry.png',
  ),
  Emoji(
    title: 'Saddes ',
    description:
        'Feeling or showing sorrow; unhappy.                                                     ' +
            'They are unhappy :(',
    imagePath: 'assets/images/sad.png',
  ),
  Emoji(
    title: 'Fear ',
    description: 'Our emotional reaction to something that seems dangerous. ',
    imagePath: 'assets/images/fear.png',
  ),
  Emoji(
    title: 'Uncertain ',
    description: 'Of a person not completely confident or sure of something..',
    imagePath: 'assets/images/uncertain.png',
  ),
  Emoji(
    title: 'Contempt ',
    description:
        'It is a behavior that evokes a sense of superiority and the right to judge over individuals, social groups and ' +
            'ultimately ideologies, among the feelings of contempt, disgust and anger..',
    imagePath: 'assets/images/contempt.png',
  ),
];
