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
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              _hGap10,

              // TABS
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: orange,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: orange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        controller.tabs.length,
                        (index) => _tabItem(
                          controller.tabs[index],
                          controller.selectedIndex.value == index,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              _hGap10,

              // PAGEVIEW
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: controller.pages,
                ),
              ),


              // BOTTOM BUTTONS
              Obx(() {
                final isFirst = controller.selectedIndex.value == 0;
                final isLast =
                    controller.selectedIndex.value ==
                    controller.pages.length - 1;

                return Row(
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        onPressed: isFirst
                            ? () {
                                debugPrint('LETER');
                              }
                            : controller.previousPage,
                        child: _bottomButton(isFirst ? 'Leter' : 'Back'),
                      ),
                    ),
                    _wGap20,
                    Expanded(
                      child: ButtonCustom(
                        onPressed: isLast
                            ? controller.simpan
                            : controller.nextPage,
                        child: _bottomButton('Next'),
                      ),
                    ),
                  ],
                );
              }),
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
        color: isActive ? transparentColor : white,
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
      margin: const EdgeInsets.only(top: 10),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: orange,
      ),
      child: Text(
        text,
        style: Poppins(fontSize: 13, color: white, fontWeight: FontWeight.w600,),
      ),
    );
  }
}
