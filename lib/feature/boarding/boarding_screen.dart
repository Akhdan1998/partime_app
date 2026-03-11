part of '../../pages.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(gradient: AppGradients.orangeGradient),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Image.asset(
                    'assets/images/boarding.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: TopCurveContainer(
                height: 430,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To\nPart Time Mon',
                        textAlign: TextAlign.center,
                        style: Poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: black,
                        ),
                      ),
                      _hGap10,
                      Text(
                        'Find a part-time job that fits your\nschedule and lifestyle.',
                        textAlign: TextAlign.center,
                        style: Poppins(fontSize: 15, color: grey),
                      ),
                      _hGap30,
                      ButtonCustom(
                        onPressed: () {
                          Get.to(SignIn());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: orange,
                          ),
                          child: Text(
                            'Get Started',
                            style: Poppins(
                              fontSize: 13,
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // ButtonCustom(
                      //   height: 45,
                      //   text: 'Get Started',
                      //   onPressed: () {
                      //     Get.to(SignIn());
                      //   },
                      //   colors: [orange, orange],
                      // ),
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
