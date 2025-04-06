import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color: Colors.orangeAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/mock_images/mock_image.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'name',
                  style: AppTextstyles().w700Text20Black,
                ),
                Text(
                  'status',
                  style: AppTextstyles().w300Text17Black,
                ),
                Text(
                  'vid',
                  style: AppTextstyles().w300Text17Black,
                ),
                Text(
                  'location',
                  style: AppTextstyles().w300Text17Black,
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
