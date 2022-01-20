import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/model/offer_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferSlider extends StatefulWidget {
  const OfferSlider({Key? key}) : super(key: key);

  @override
  _OfferSliderState createState() => _OfferSliderState();
}

class _OfferSliderState extends State<OfferSlider> {
  // active image in the slider
  int activeIndex = 0;
  // page index slider
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
        // slider for the offer images
        CarouselSlider.builder(
          itemCount: OfferImages.images.length,
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.96,
            autoPlayInterval: Duration(seconds: 4),
            onPageChanged: (index, reason) => pageIndicate(index),
          ),
          itemBuilder: (context, index, realIndex) {
            // container for image
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(OfferImages.images[index]),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            );
          },
        ),
        // slider indicatino: bubble dot
        SizedBox(
          height: 20,
          child: Container(
            child: buildIndicator(),
          ),
        )
      ],
    );
  }

  // image index indicator for slider images
  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: OfferImages.images.length,
        effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            type: WormType.thin,
            activeDotColor: Colors.orange.shade400,
            dotColor: Colors.black54),
      );
}
