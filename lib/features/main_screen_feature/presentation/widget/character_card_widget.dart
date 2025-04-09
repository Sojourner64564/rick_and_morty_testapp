import 'package:flutter/material.dart';
import 'package:rick_and_morty_testapp/core/assets/app_colors.dart';
import 'package:rick_and_morty_testapp/core/assets/app_textstyles.dart';
import 'package:rick_and_morty_testapp/features/main_screen_feature/domain/entity/result_entity.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key, required this.resultEntity,});
  final ResultEntity resultEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color: AppColors.grey002,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network( //TODO сделать в случае ошибки
                            resultEntity.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (buildContext, widget, imageChunkEvent){
                              if (imageChunkEvent == null) {
                                return widget;
                              }
                              return const Center(
                                  child: CircularProgressIndicator(),
                              );
                            },
                        ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        resultEntity.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextstyles.w700Text20Black,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Status: ',
                                style: AppTextstyles.w300Text17Black,
                              ),
                              TextSpan(
                                text: resultEntity.status,
                                style: AppTextstyles.w300Text17Grey,
                              ),
                            ]
                        ),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Species: ',
                                style: AppTextstyles.w300Text17Black,
                              ),
                              TextSpan(
                                text: resultEntity.species,
                                style: AppTextstyles.w300Text17Grey,
                              ),
                            ]
                        ),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Location: ',
                                style: AppTextstyles.w300Text17Black,
                              ),
                              TextSpan(
                                text: resultEntity.location.name,
                                style: AppTextstyles.w300Text17Grey,
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
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
                  Icons.star_border_outlined,
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
