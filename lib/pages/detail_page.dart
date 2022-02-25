import 'package:bloctutorial/cubit/app_cubit_states.dart';
import 'package:bloctutorial/cubit/app_cubits.dart';
import 'package:bloctutorial/misc/colors.dart';
import 'package:bloctutorial/widgets/app_buttons.dart';
import 'package:bloctutorial/widgets/app_large_text.dart';
import 'package:bloctutorial/widgets/app_text.dart';
import 'package:bloctutorial/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state){
      DetailState detail = state as DetailState;
      int gottenStars = detail.splace.stars;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" + detail.splace.img
                            )
                        )
                    ),
                  )
              ),
              Positioned(
                  left: 20,
                  top: 40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  )
              ),
              Positioned(
                  top: 270,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 30
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.splace.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$ ${detail.splace.price}",
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 10,),
                            AppText(
                              text: detail.splace.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < gottenStars ? AppColors.starColor : AppColors.textColor2,
                                );
                              }),
                            ),
                            SizedBox(width: 10,),
                            AppText(
                              text: "(${detail.splace.stars}.0)",
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 5,),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(height: 10,),
                        Wrap(
                          children: List.generate(detail.splace.people, (index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10
                                ),
                                child: AppButtons(
                                  color: selectedIndex == index ? Colors.white : Colors.black,
                                  backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                  size: 50,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20,),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 5,),
                        AppText(
                          text: detail.splace.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  )
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      size: 60,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
