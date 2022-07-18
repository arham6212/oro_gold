import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_gold/bloc/locker_contents_bloc.dart';
import 'package:oro_gold/components/cache-image-widget.dart';
import 'package:oro_gold/components/common_app_bar.dart';
import 'package:oro_gold/components/common_button.dart';
import 'package:oro_gold/components/small_button.dart';
import 'package:oro_gold/components/vertical_spacing.dart';
import 'package:oro_gold/models/locker-contents-model.dart';
import 'package:oro_gold/themes/app_colors.dart';

import '../utils/tools.dart';

class LockerContentScreen extends StatefulWidget {
  const LockerContentScreen({Key? key}) : super(key: key);

  @override
  _LockerContentScreenState createState() => _LockerContentScreenState();
}

class _LockerContentScreenState extends State<LockerContentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LockerContentsBloc>(context)
        .add(NavigatedToLockerContentScreenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Locker Contents',
      ),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<LockerContentsBloc, LockerContentsState>(
                builder: (_, state) {
                  if (state is LockerContentsInitialState ||
                      state is LockerContentsFetchingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LockerContentsFetchedState) {
                    return GridView.builder(
                        itemCount: state.lockerContentsModel.lockerContentsData
                                ?.length ??
                            0,
                        gridDelegate:
 SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:Tools.isTablet(context)? 3:2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                mainAxisExtent: Tools.isTablet(context)?400:280),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return GridWidget(
                            lockerContentsModel: state.lockerContentsModel,
                            index: index,
                          );
                        });
                  } else {
                    return const Center(
                      child: Text(
                        'Something Went Wrong',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.w800),
                      ),
                    );
                  }
                },
                listener: (BuildContext context, Object? state) {},
              ),
            ),
            Container(
              color: Colors.transparent,
              height: Tools.isTablet(context)?120:80,
              child: Center(
                  child: CommonButton(
                text: 'Pay',
                callback: () {
                  Navigator.of(context).pushNamed('plan_screen');
                },
                width: double.infinity,
              )),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 25,
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  final String features, value;

  const DataWidget({Key? key, required this.features, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          features,
          style: TextStyle(
              color: AppColors.subtleText,
              fontSize:Tools.isTablet(context)?12: 6,
              fontWeight: FontWeight.w700),
        ),
        const VerticalSpacing(height: 2),
        Text(
          value,
          style: TextStyle(
              fontSize: Tools.isTablet(context)?18:10,
              color: AppColors.blackText,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 13,
        )
      ],
    );
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key, required this.lockerContentsModel, required this.index})
      : super(key: key);
  final LockerContentsModel lockerContentsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    LockerContentsData? gridData =
        lockerContentsModel.lockerContentsData?[index];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(
            height: 12,
          ),
          Center(
            child: Container(
              height: Tools.isTablet(context)?150:100,
              
              child: gridData?.image==null? Center(
                  child: Text(
                'SEAL PHOTOS\nHERE',
                style: TextStyle(fontSize: Tools.isTablet(context)?20:12, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )): CacheImageWidget(gridData!.image??'', fit: BoxFit.cover,),
              color: Colors.grey.shade100,
            ),
          ),
          const VerticalSpacing(
            height: 8,
          ),
          Align(
            child: Text(
              "${lockerContentsModel.lockerContentsData?[index].id}",
              style: TextStyle(fontSize: Tools.isTablet(context)?18:12, fontWeight: FontWeight.w600),
            ),
          ),
          const VerticalSpacing(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                gridData?.itemName??'-',
                style: TextStyle(fontSize: Tools.isTablet(context)?18:12, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                child:  Text('${gridData?.qty} QTY',
                    style: TextStyle(fontSize:Tools.isTablet(context)?14: 8, fontWeight: FontWeight.w800)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: AppColors.mediumYellow),
                  color: AppColors.lightOroYellow,
                ),
              ),
            ],
          ),
          const VerticalSpacing(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: DataWidget(
                      features: 'QUALITY', value: gridData?.quality ?? '-')),
              Expanded(
                  child: DataWidget(
                      features: 'STONE WEIGHT',
                      value: gridData?.weight ?? '-')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: DataWidget(
                      features: 'GROSS WEIGHT',
                      value: gridData?.grossWeight ?? '')),
              Expanded(
                child: DataWidget(
                    features: 'NET WEIGHT / ANW',
                    value: gridData?.netWeight ?? ''),
              ),
            ],
          ),
          const VerticalSpacing(height: 10),
          Align(
              child: SmallButton(
            text: 'View Gold Photos',
            callback: () {},
            color: AppColors.mediumYellow,
          ))
        ],
      ),
    );
  }
}
