part of '../../../pages.dart';

class DocumentItem extends StatelessWidget {
  final String title;
  final String fileName;
  final String addedText;

  const DocumentItem({
    super.key,
    required this.title,
    required this.fileName,
    required this.addedText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Poppins(color: black, fontSize: 13)),
        _hGap10,
        DashedBorderContainer(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(Icons.file_open_rounded),
                _wGap20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 104,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fileName, style: Poppins(color: black)),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: transparentColor,
                              child: Icon(Icons.close, color: grey, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      addedText,
                      style: Poppins(color: orange, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}