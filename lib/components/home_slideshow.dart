import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/model/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferSlider extends StatefulWidget {
  const OfferSlider({Key? key}) : super(key: key);

  @override
  _OfferSliderState createState() => _OfferSliderState();
}

class _OfferSliderState extends State<OfferSlider> {
  int activeIndex = 0;

  void pageIndicate(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: Images.images.length,
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.96,
            autoPlayInterval: Duration(seconds: 4),
            onPageChanged: (index, reason) => pageIndicate(index),
            // autoPlayAnimationDuration: Duration(seconds: 1)
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.images[index]),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
          },
        ),
        SizedBox(
          height: 20,
          child: Container(
            // color: Colors.black54,
            child: buildIndicator(),
          ),
        )
      ],
    );
  }

  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: Images.images.length,
        effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            type: WormType.thin,
            activeDotColor: Colors.orange.shade400,
            dotColor: Colors.black54),
      );
}
