part of '../../pages.dart';

class FormData extends StatelessWidget {
  FormData({super.key});

  final FormDataController controller = Get.put(FormDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(
        title: controller.title,
        showBackButton: false,
        showMoreButton: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _hGap20,

              // TABS
              Obx(() => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: orange,
                ),
                child: Obx(() => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: orange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      controller.tabs.length,
                          (index) => GestureDetector(
                        onTap: () => controller.changeTab(index),
                        child: _tabItem(
                          controller.tabs[index],
                          controller.selectedIndex.value == index,
                        ),
                      ),
                    ),
                  ),
                )),
              )),

              _hGap20,

              // PAGEVIEW
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: controller.pages,
                ),
              ),


              _hGap20,

              // BOTTOM BUTTONS
              Row(
                children: [
                  Expanded(
                    child: ButtonCustom(
                      onPressed: () {
                        debugPrint('LETER ${controller.role}');
                      },
                      child: _bottomButton('Leter'),
                    ),
                  ),
                  _wGap20,
                  Expanded(
                    child: ButtonCustom(
                      onPressed: () {
                        debugPrint('NEXT ${controller.role}');
                      },
                      child: _bottomButton('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isActive ? Colors.transparent : white,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Poppins(
          fontSize: 12,
          color: isActive ? white : black,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _bottomButton(String text) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: orange,
      ),
      child: Text(
        text,
        style: Poppins(
          fontSize: 13,
          color: white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}