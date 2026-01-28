part of '../../pages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s Get Started!',
              style: Poppins(
                fontSize: 20,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            _hGap20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                _hGap10,
                TextFieldCustom(
                  hintText: 'Email',
                  borderRadius: 50,
                  keyboardType: TextInputType.emailAddress,
                  borderSide: BorderSide(color: grey),
                  focusedBorderSide: BorderSide(color: grey),
                  enabledBorderSide: BorderSide(color: grey),
                  errorBorderSide: BorderSide(color: red),
                ),
                _hGap20,
                Text(
                  'Password',
                  style: Poppins(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                _hGap10,
                TextFieldCustom(
                  hintText: 'Password',
                  borderRadius: 50,
                  borderSide: BorderSide(color: grey),
                  focusedBorderSide: BorderSide(color: grey),
                  enabledBorderSide: BorderSide(color: grey),
                  errorBorderSide: BorderSide(color: red),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: Poppins(color: transparentColor, fontSize: 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: Poppins(color: orange, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ButtonCustom(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: orange,
                ),
                child: Text(
                  'Login',
                  style: Poppins(
                    fontSize: 13,
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            _hGap20,
            Row(
              children: [
                Expanded(child: _buildDivider(context, color: grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or sign in with',
                    style: Poppins(color: grey, fontSize: 10),
                  ),
                ),
                Expanded(child: _buildDivider(context, color: grey)),
              ],
            ),
            _hGap20,
            ButtonCustom(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: grey),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apple, color: black),
                    _wGap10,
                    Text(
                      'Sign in using Apple',
                      style: Poppins(
                        fontSize: 13,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _hGap20,
            ButtonCustom(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: grey),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png', width: 18,),
                    // Icon(Icons.apple, color: black),
                    _wGap10,
                    Text(
                      'Sign in using Google',
                      style: Poppins(
                        fontSize: 13,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: Poppins(color: black, fontSize: 12),
                ),
                ButtonCustom(
                  onPressed: () {},
                  child: Text(
                    'Signup',
                    style: Poppins(color: orange, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
