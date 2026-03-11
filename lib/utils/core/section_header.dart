part of '../../../pages.dart';

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: grey.withOpacity(0.4),
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Poppins(
              color: black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back(result: index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.edit, color: black, size: 17),
            ),
          ),
        ],
      ),
    );
  }
}
