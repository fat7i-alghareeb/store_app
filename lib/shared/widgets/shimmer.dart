import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final List<double> paddingLTRB;
  final double hight;
  final double width;
  final double borderRadius;
  const ShimmerWidget({
    super.key,
    required this.paddingLTRB,
    required this.hight,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLTRB[0], paddingLTRB[1], paddingLTRB[2], paddingLTRB[3]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.grey[600]?.withOpacity(0.7),
        ),
        height: hight,
        width: width,
      ),
    );
  }
}

class CategoryScreenShimmer extends StatelessWidget {
  const CategoryScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ShimmerWidget(
                paddingLTRB: const [5, 0, 10, 5],
                hight: (MediaQuery.of(context).size.height * 0.3),
                width: (MediaQuery.of(context).size.width - 50) / 2,
                borderRadius: 11,
              ),
              ShimmerWidget(
                paddingLTRB: const [10, 0, 0, 5],
                hight: (MediaQuery.of(context).size.height * 0.3),
                width: (MediaQuery.of(context).size.width - 50) / 2,
                borderRadius: 11,
              ),
            ],
          ),
        );
      },
    );
  }
}
