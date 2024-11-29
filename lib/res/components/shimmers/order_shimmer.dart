
import 'package:flutter/material.dart';
import 'package:matka/utils/sizes.dart';
import 'package:shimmer/shimmer.dart';

import '../../../main.dart';

class OrderShimmer extends StatelessWidget {
  const OrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
            color: Colors.grey.withOpacity(0.1)
        ),
        padding: EdgeInsets.symmetric(
            horizontal: rwidth * .02, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 20,
                    width: rwidth * .35,
                    color: Colors.grey.withOpacity(0.3)),
                const Spacer(),
                Container(
                    height: 20,
                    width: rwidth * .35,
                    color: Colors.grey.withOpacity(0.3)),
               ],
            ),
            context.mheight(.01),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 20,
                  width: rwidth * .65,
                  color: Colors.grey.withOpacity(0.3)),
            ),
            context.mheight(.01),
      Align(
        alignment: Alignment.center,
        child: Container(
            height: 20,
            width: rwidth * .65,
            color: Colors.grey.withOpacity(0.3)),
      ),],
        ),
      ),
      /*  child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: rwidth * .04, vertical: rheight * .018),
          margin: EdgeInsets.symmetric(vertical: rheight * .015),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(11)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20,
                  width: rwidth * .7,
                  color: Colors.grey.withOpacity(0.4)),
              context.mheight(0.015),
              Container(
                  height: 20,
                  width: rwidth * .5,
                  color: Colors.grey.withOpacity(0.4)),
              context.mheight(0.015),
              Container(
                  height: 20,
                  width: rwidth * .3,
                  color: Colors.grey.withOpacity(0.4)),
            ],
          ),
        )*/

    );
  }
}
