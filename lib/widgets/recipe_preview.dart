import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class RecipePreview extends StatelessWidget {
  final String picture;
  final String category;
  final String name;

  const RecipePreview(
      {Key? key,
      required this.picture,
      required this.category,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      height: 100,
      child: Row(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            elevation: 0,
            // child: Container(
            //   // height: 100,
            //   width: 100,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: Image.network(
              picture,
              fit: BoxFit.cover,
            ),
          ),
          // ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // 'A RenderFlex overflowed by some pixels on the right',
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeFonts.rb14,
                ),
                // Expanded(child: SizedBox()),

                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/hatActive.svg',
                      ),
                    ),
                    const SizedBox(width: 3),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/hatActive.svg',
                      ),
                    ),
                    const SizedBox(width: 3),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/hatActive.svg',
                      ),
                    ),
                    const SizedBox(width: 3),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/hatActive.svg',
                      ),
                    ),
                    const SizedBox(width: 3),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/hatActive.svg',
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '9.0',
                      style: ThemeFonts.rp10,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 9,
                          width: 9,
                          child: SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                ThemeColors.primary, BlendMode.modulate),
                            'assets/images/starActive.svg',
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 9,
                              width: 9,
                              child: SvgPicture.asset(
                                colorFilter: ColorFilter.mode(
                                    ThemeColors.primary, BlendMode.modulate),
                                'assets/images/starActive.svg',
                              ),
                            ),
                            const SizedBox(width: 1),
                            SizedBox(
                              height: 9,
                              width: 9,
                              child: SvgPicture.asset(
                                colorFilter: ColorFilter.mode(
                                    ThemeColors.primary, BlendMode.modulate),
                                'assets/images/starActive.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Intermediate',
                      style: ThemeFonts.rg10,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            ThemeColors.primary, BlendMode.modulate),
                        'assets/images/clock.svg',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '1h 20 m',
                      style: ThemeFonts.rg10,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: ThemeColors.greyLight,

                          alignment: Alignment.center,
                          width: 125,
                          child: Text(
                            'Check recipe',
                            style: ThemeFonts.rp12,
                          ),
                        ),
                        // Expanded(child: const SizedBox()),
                        SizedBox(
                          height: 12,
                          width: 12,
                          child: SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                ThemeColors.primary, BlendMode.modulate),
                            'assets/images/flagActive.svg',
                          ),
                        ),
                        // const SizedBox(width: 20),
                        SizedBox(
                          height: 12,
                          width: 12,
                          child: SvgPicture.asset(
                            colorFilter: ColorFilter.mode(
                                ThemeColors.primary, BlendMode.modulate),
                            'assets/images/share.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
