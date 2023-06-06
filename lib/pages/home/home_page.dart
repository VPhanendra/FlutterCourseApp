import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fultter_courseapp/common/values/colors.dart';
import 'package:fultter_courseapp/pages/home/bloc/home_page_blocs.dart';

import 'package:fultter_courseapp/pages/home/widgets/home_page_widgets.dart';

import 'bloc/home_page_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText("Hello",
                      color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(
                  child: homePageText("AMMA", top: 5),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 0.w
                ),
                  sliver: SliverGrid(delegate: SliverChildBuilderDelegate(
                    childCount: 4, (BuildContext context, index) {
                   return   GestureDetector(
                     onTap: (){

                     },
                     child: Container(
                       padding: EdgeInsets.all(12.w),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15.w),
                         image: const DecorationImage(
                           fit: BoxFit.fill,
                             image: AssetImage(
                             "assets/icons/Art.png"))
                       ),
                       child: courseGrid(),
                     ),
                   );
                  }),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6
                      )
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
