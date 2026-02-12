part of '../pages.dart';

class CusImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;
  final double size;
  final Color iconColor;
  final Color iconBackground;
  final String? networkImage;

  const CusImagePicker({
    super.key,
    required this.imageFile,
    required this.onTap,
    this.size = 120,
    this.iconColor = Colors.white,
    this.iconBackground = Colors.green,
    this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(contexted!).size.shortestSide >= 600;
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.topCenter,
      children: [
        Center(
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imageFile != null
                  ? Image.file(
                      imageFile!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : (networkImage != null && networkImage!.isNotEmpty
                        ? Image.network(
                            networkImage!,
                            width: size,
                            height: size,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/person.png',
                                width: size,
                                height: size,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/person.png',
                            width: size,
                            height: size,
                            fit: BoxFit.cover,
                          )),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: Platform.isIOS
              ? isTablet
                    ? 330
                    : 120
              : 125,
          // top: size * 0.71,
          // right: size * 0.99,
          child: Container(
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(Icons.add, color: iconColor, size: 25),
          ),
        ),
      ],
    );
  }
}
