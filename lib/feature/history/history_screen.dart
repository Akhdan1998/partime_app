part of '../../pages.dart';

class History extends StatefulWidget {
  const History({super.key, required this.role});

  final String role;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late final HistoryController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      HistoryController(role: widget.role),
      tag: widget.role,
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<HistoryController>(tag: widget.role)) {
      Get.delete<HistoryController>(tag: widget.role);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CusAppBar(
        title: 'History',
        showBackButton: false,
        showMoreButton: false,
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _hGap20,
              TextFieldCustom(
                controller: controller.searchC,
                onChanged: controller.onSearchChanged,
                fillColor: white.withOpacity(0.2),
                hintText: 'Search',
                hintColor: grey,
                enabledBorderSide:  BorderSide(width: 1.2, color: orange),
                focusedBorderSide:  BorderSide(width: 1.2, color: orange),
                borderSide:  BorderSide(width: 1.2, color: orange),
                errorBorderSide:  BorderSide(width: 1.2, color: red),
                suffixIcon:  Icon(Icons.sort, color: black),
                prefixIcon:  Icon(Icons.search, color: black),
              ),
              _hGap20,
              Expanded(
                child: Obx(() {
                  final items = controller.filteredItems;

                  if (items.isEmpty) {
                    return Center(
                      child: Text(
                        'No history found',
                        style: Poppins(fontSize: 14, color: grey),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(items.length, (index) {
                        final item = items[index];
                        final isLast = index == items.length - 1;

                        return Column(
                          children: [
                            _HistoryItem(
                              item: item,
                              isCompany: controller.isCompany,
                            ),
                            if (!isLast) ...[
                              _hGap10,
                              _buildDivider(context, color: grey),
                              _hGap10,
                            ],
                          ],
                        );
                      }),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({
    required this.item,
    required this.isCompany,
  });

  final HistoryItemData item;
  final bool isCompany;

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: () {},
      child: Container(
        color: transparentColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.3),
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.image_sharp,
                color: grey.withOpacity(0.5),
                size: 20,
              ),
            ),
            _wGap15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: Poppins(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _wGap10,
                      _StatusBadge(
                        label: item.status,
                        color: item.statusColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Applying for position: ',
                        style: Poppins(fontSize: 14),
                      ),
                      Expanded(
                        child: Text(
                          item.position,
                          style: Poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  _hGap5,
                  isCompany
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.dateTime,
                        style: Poppins(
                          fontSize: 12,
                          color: grey,
                        ),
                      ),
                      if (item.showRating)
                        _RatingStars(rating: item.rating),
                    ],
                  )
                      : Text(
                    item.dateTime,
                    style: Poppins(
                      fontSize: 12,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Text(
        label,
        style: Poppins(
          fontSize: 12,
          color: white,
        ),
      ),
    );
  }
}