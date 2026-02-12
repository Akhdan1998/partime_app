part of '../../pages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: white,
          child: Form(
            key: controller.formKey,
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
                LabeledTextField(
                  label: 'Email',
                  hintText: 'pendekargendut@gmail.com',
                  controller: controller.email,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Email cannot be empty' : null,
                ),
                _hGap20,
                LabeledTextField(
                  label: 'Password',
                  hintText: '********',
                  controller: controller.password,
                  obscureText: true,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Password cannot be empty'
                      : null,
                ),
                _hGap20,
                ButtonCustom(
                  onPressed: controller.login,
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
                        Image.asset('assets/images/google.png', width: 18),
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
                const SizedBox(height: 100),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: Poppins(color: black, fontSize: 12),
                    ),
                    ButtonCustom(
                      onPressed: () {
                        Get.to(Signup());
                      },
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
        ),
      ),
    );
  }
}
