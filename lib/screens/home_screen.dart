import 'package:flutter/material.dart';
import 'package:oro_gold/common/app_images.dart';
import 'package:oro_gold/components/common_button.dart';
import 'package:oro_gold/components/vertical_spacing.dart';
import 'package:oro_gold/components/video_player_oro.dart';
import 'package:oro_gold/themes/app_colors.dart';
import 'package:oro_gold/utils/tools.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:video_player/video_player.dart';

import '../components/pdf-alert-dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Tools.isTablet(context) ? 120 : 100,
        leading: Icon(
          Icons.menu,
          size: Tools.isTablet(context) ? 50 : 25,
        ),
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: AppColors.backGroundColor,
        title: Image.asset(
          AppImages.appLogoImage,
          fit: BoxFit.contain,
          height: Tools.isTablet(context) ? 80 : 50,
        ),
        actions: [
          InkWell(
            onTap: () async {
              showDialog(
                context: context,
                builder: (_) => PdfAlertDialog(),
              );
            },
            child: Row(
              children: [
                Image.asset(
                  AppImages.mapPin,
                  height: Tools.isTablet(context) ? 40 : 20,
                ),
                const SizedBox(width: 5),
                Text(
                  'Ekyc',
                  style: TextStyle(
                      fontSize: Tools.isTablet(context) ? 25 : 14,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 28)
              ],
            ),
          )
        ],
      ),
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  const LockerTimeLineWidget(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current doorstep locker visit'.toUpperCase(),
                          style: TextStyle(
                              fontSize: Tools.isTablet(context) ? 15 : 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.subTitleText),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Locker',
                          style: TextStyle(
                              fontSize: Tools.isTablet(context) ? 30 : 24,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'We will confirm your request shortly.',
                          style: TextStyle(
                              fontSize: Tools.isTablet(context) ? 22 : 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.subTitleText),
                        ),
                        const SizedBox(height: 16),
                        CommonButton(
                          callback: () {
                            Navigator.of(context).pushNamed('locker');
                          },
                          width: double.infinity,
                          text: 'Locker Contents',
                          icon: Icons.chevron_right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Advantages of Doorstep Lockers',
                    style: styleForCommonHeading(context),
                  ),
                  const VerticalSpacing(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Access lockers at your doorstep.',
                      style: TextStyle(
                          fontSize: Tools.isTablet(context) ? 20 : 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackText),
                    )),
                  ),
                  const VerticalSpacing(height: 24),
                  Text(
                    'A sneak-peek into our Locker Space!',
                    style: styleForCommonHeading(context),
                  ),
                  const VerticalSpacing(),
                  Container(
                    color: Colors.white,
                    child: VideoPlayerOro(),
                    // child: VideoPlayer(_videoPlayerController),
                    // child:  Icon(
                    //   Icons.play_arrow_outlined,
                    //   size: Tools.isTablet(context)?69:45,
                    // ),
                  ),
                  const VerticalSpacing(height: 24),
                  Text('Where are your Locker Items stored?',
                      style: styleForCommonHeading(context)),
                  const VerticalSpacing(),
                  SizedBox(
                    height: Tools.isTablet(context) ? 200 : 120,
                    child: ListView.separated(
                      separatorBuilder: (_, index) {
                        return const SizedBox(width: 10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                            AppImages.goldImages,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const VerticalSpacing(height: 24),
                  Text(
                    'Safe & Secure Guarantee',
                    style: styleForCommonHeading(context),
                  ),
                  const VerticalSpacing(),
                  SizedBox(
                    height: Tools.isTablet(context) ? 85 : 40,
                    child: ListView.separated(
                      separatorBuilder: (_, index) {
                        return const SizedBox(width: 20);
                      },
                      itemCount: 13,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Image.asset(
                          index % 3 == 0
                              ? AppImages.appLogoImage
                              : (index % 3 == 1)
                                  ? AppImages.godrejLogo
                                  : AppImages.newIndiaImage,
                        );
                      },
                    ),
                  ),
                  const VerticalSpacing(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



TextStyle styleForCommonHeading(BuildContext context) => TextStyle(
    color: AppColors.blackText,
    fontSize: Tools.isTablet(context) ? 24 : 16,
    fontWeight: FontWeight.w700);

class LockerTimeLineWidget extends StatelessWidget {
  const LockerTimeLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 150,
        width: Tools.isTablet(context) ? 90 : 60,
        child: Center(
          child: DottedLine(
            lineLength: 150,
            direction: Axis.vertical,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: AppColors.inactiveText,
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
        ),
      ),
      Positioned(
          top: 0,
          left: 14,
          child: Image.asset(
            AppImages.clockIcon,
            height: 32,
          )),
      Positioned(
        top: 60,
        left: 16,
        child: Container(
          height: 30,
          width: 30,
          child: const Icon(
            Icons.check,
            color: Colors.grey,
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade100, shape: BoxShape.circle),
        ),
      ),
      Positioned(
        top: 120,
        left: 16,
        child: Container(
          height: 30,
          width: 30,
          child: const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade100, shape: BoxShape.circle),
        ),
      ),
    ]);
  }
}
