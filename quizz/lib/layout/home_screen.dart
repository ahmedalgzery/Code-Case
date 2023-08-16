import 'package:flutter/material.dart';
import 'package:quizz/data/question_data.dart';
import 'package:quizz/modules/result_screen.dart';
import '../shard/style/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Question ${index + 1}/${questions.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 10.0,
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    question.question!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  for (final answer in question.answer!.entries)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 18.0),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: secondColor,
                        hoverColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: () {
                          setState(() {
                            isPressed = true;
                          });
                          if (answer.value) {
                            score += 5;
                          }
                        },
                        child: Text(
                          answer.key,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: OutlinedButton(
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score),
                                        ),
                                      );
                                    }
                                  : () {
                                      _controller.nextPage(
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        curve: Curves.linear,
                                      );
                                    }
                              : null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(secondColor),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(),
                            ),
                          ),
                          child: Text(
                            index + 1 == questions.length
                                ? 'see result'
                                : 'Next Question',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
