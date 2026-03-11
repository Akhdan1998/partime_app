part of '../pages.dart';

class _RatingStars extends StatelessWidget {
  final int rating;

  const _RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? Colors.yellow : grey,
          size: 15,
        ),
      ),
    );
  }
}