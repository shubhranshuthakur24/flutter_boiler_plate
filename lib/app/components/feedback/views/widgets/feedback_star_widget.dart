import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackStarRating extends StatefulWidget {
  final double rating;
  final double starSize;
  final int starCount;
  final Color ratedStarColor;
  final Color unratedStarBorderColor;
  final double borderThickness;
  final ValueChanged<double> onRatingChanged;

  FeedbackStarRating({
    required this.rating,
    required this.starSize,
    required this.starCount,
    required this.ratedStarColor,
    required this.unratedStarBorderColor,
    required this.borderThickness,
    required this.onRatingChanged,
  });

  @override
  _FeedbackStarRatingState createState() => _FeedbackStarRatingState();
}

class _FeedbackStarRatingState extends State<FeedbackStarRating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      minRating: 0,
      direction: Axis.horizontal,
      itemCount: widget.starCount,
      itemSize: widget.starSize,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: index + 1 <= widget.rating
              ? widget.ratedStarColor
              : widget.unratedStarBorderColor,
        );
      },
      onRatingUpdate: (rating) {
        widget.onRatingChanged(rating);
      },
    );
  }
}
