import 'package:cling_connect/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List onBoardingData = [
    {
      "image": 'assets/images/Frame0.png',
      "title": 'Be Kind to you !',
      "subtitle":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et '
    },
    {
      "image": 'assets/images/Frame1.png',
      "title": 'Its ok to Recharge !',
      "subtitle":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et '
    },
    {
      "image": 'assets/images/Frame2.png',
      "title": "You'll be fine !",
      "subtitle":
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et '
    },
  ];

  Color whiteColor = Colors.white;
  Color otherColor = Colors.black;

  PageController pageController = PageController();

  continueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: continueMethod,
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(onBoardingData[index]['image']),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 30, 8, 8),
                    child: Text(
                      onBoardingData[index]['title'],
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        onBoardingData[index]['subtitle'],
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    onBoardingData.length,
                    (index) {
                      return AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        height: 10,
                        width: (index == currentPage) ? 10 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == currentPage)
                                ? Colors.blue
                                : Colors.grey),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Opacity(
                      opacity: currentPage == (onBoardingData.length - 1)
                          ? 1.0
                          : 0.0,
                      child: ElevatedButton(
                        onPressed: currentPage == (onBoardingData.length - 1)
                            ? continueMethod
                            : null,
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
