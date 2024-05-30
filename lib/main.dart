import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageContent() {
    return [
      _buildOnboardingPage(
        title: 'Quality',
        description:
        'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
        image: 'assest/Group1.png', // Replace with your image asset
        backgroundColor: Colors.green,
      ),
      _buildOnboardingPage(
        title: 'Convenient',
        description:
        'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
        image: 'assest/Group2.png', // Replace with your image asset
        backgroundColor: Colors.red,
      ),
      _buildOnboardingPage(
        title: 'Local',
        description:
        'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.',
        image: 'assest/Group3.png', // Replace with your image asset
        backgroundColor: Colors.orange,
      ),
    ];
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required String image,
    required Color backgroundColor,
  }) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Container(
          height: 400,
          color: backgroundColor,
          alignment: Alignment.center,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            height: 100,

            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(backgroundColor)),
          onPressed: () {
            // Add your navigation logic here
          },
          child: Text(style: TextStyle(color: Colors.white),'Join the movement!')
          ,

        ),
        TextButton(
          onPressed: () {
            // Add your navigation logic here
          },
          child: Text('Login'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _buildPageContent(),
      ),
      bottomSheet: _currentPage == 2
          ? TextButton(
        onPressed: () {
          // Add your navigation logic here
        },
        child: Text('Get Started'),
      )
          : Container(
        height: 60,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
                (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 10,
              width: _currentPage == index ? 20 : 10,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.blue
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
