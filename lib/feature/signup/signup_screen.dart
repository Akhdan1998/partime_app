part of '../../pages.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create New ',
                        style: Poppins(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      TextSpan(
                        text: 'Account',
                        style: Poppins(
                          color: orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                _hGap20,
                Text(
                  'Fill Your Details Or Continue With Social Media',
                  style: Poppins(),
                  textAlign: TextAlign.center,
                ),
                _hGap20,
                CusImagePicker(
                  iconBackground: orange,
                  imageFile: controller.image.value,
                  onTap: () {
                    showReusableBottomSheet(
                      heightFraction: 0.3,
                      context: context,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Choose Image',
                                  style: Poppins(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    color: transparentColor,
                                    child: Icon(Icons.close, color: black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          _hGap15,
                          _buildDivider(context),
                          _hGap20,
                          ButtonCustom(
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: orange,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_library_outlined,
                                    color: white,
                                  ),
                                  _wGap15,
                                  Text(
                                    'Take from Gallery',
                                    style: Poppins(
                                      fontSize: 13,
                                      color: white,
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
                                color: white,
                                border: Border.all(width: 1, color: orange),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: orange,
                                  ),
                                  _wGap15,
                                  Text(
                                    'Take from Camera',
                                    style: Poppins(
                                      fontSize: 13,
                                      color: orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _hGap30,
                        ],
                      ),
                    );
                  },
                  size: 110,
                  iconColor: white,
                ),
                _hGap20,
                Obx(() {
                  final pickedTitle =
                      (controller.selectedItem.value?['title'] ?? '').tr;
                  final titleText = pickedTitle.isEmpty
                      ? 'Register as'
                      : 'Register as $pickedTitle';

                  return ReusableExpansionTile<Map<String, String>>(
                    title: titleText,
                    items: userNavigation,
                    closeOnSelect: true,

                    onItemPressed: (item) {
                      controller.select(item);
                      final itemKey =
                          item['value'] ?? item['id'] ?? item['title'];
                      debugPrint('Selected: ${item['title']} | key=$itemKey');
                    },

                    selectedItemColor: transparentColor,
                    unselectedItemColor: transparentColor,

                    itemBuilder: (item, _) {
                      final selectedKey =
                          controller.selectedItem.value?['value'] ??
                          controller.selectedItem.value?['id'] ??
                          controller.selectedItem.value?['title'];

                      final itemKey =
                          item['value'] ?? item['id'] ?? item['title'];

                      final isSelected =
                          (selectedKey != null &&
                          itemKey != null &&
                          selectedKey == itemKey);

                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        title: Text(
                          (item['title'] ?? '').tr,
                          style: Poppins(
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: isSelected ? orange : black,
                            fontSize: 13,
                          ),
                        ),
                        trailing: isSelected
                            ? Icon(Icons.check, size: 18, color: orange)
                            : const SizedBox.shrink(),
                      );
                    },

                    borderColor: grey,
                    onExpansionChanged: (_) {},
                    minTileHeight: 50,
                    fontSize: 15,
                    textColor: black,
                    dividerColor: grey,
                    trailingColor: grey,
                    titleAlignment: Alignment.centerLeft,
                  );
                }),
                Obx(() {
                  if (!controller.isCompany.value) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    children: [
                      _hGap20,
                      LabeledTextField(
                        label: 'Company Name',
                        hintText: 'Company Name',
                        controller: controller.companyName,
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Company Name cannot be empty'
                            : null,
                      ),
                    ],
                  );
                }),
                _hGap20,
                LabeledTextField(
                  label: 'User Name',
                  hintText: 'User Name',
                  // controller: user_name,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'User Name cannot be empty'
                      : null,
                ),
                _hGap20,
                LabeledTextField(
                  label: 'Email',
                  hintText: 'pendekargendut@gmail.com',
                  // controller: email,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Email cannot be empty' : null,
                ),
                _hGap20,
                LabeledTextField(
                  label: 'Password',
                  hintText: '********',
                  obscureText: true,
                  // controller: pass,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Password cannot be empty'
                      : null,
                ),
                _hGap20,
                ButtonCustom(
                  onPressed: () {
                    SnackbarHelper.success('Successfully Created Account');
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
                      'Sign Up',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have Account? ',
                      style: Poppins(color: black, fontSize: 12),
                    ),
                    ButtonCustom(
                      onPressed: () {
                        Get.to(SignIn());
                      },
                      child: Text(
                        'Log In',
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
