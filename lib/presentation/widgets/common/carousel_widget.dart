import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257,
      width: double.infinity,
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 257,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrls[index],
                      errorBuilder: (context, exception, stackTrace) {
                        return const Center(
                          child: Text('Ощибка загрузки...',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                              )),
                        );
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: imageUrls.length,
                    decorator: const DotsDecorator(
                      color: Color.fromARGB(80, 0, 0, 0), // Inactive color
                      activeColor: Colors.black,
                    ),
                    position: index,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
