
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_gold/bloc/payment_tles_bloc.dart';
import 'package:oro_gold/common/app_images.dart';
import 'package:oro_gold/components/common_app_bar.dart';
import 'package:oro_gold/components/common_button.dart';
import 'package:oro_gold/components/vertical_spacing.dart';
import 'package:oro_gold/models/choose_plan_model.dart';
import 'package:oro_gold/service/repository.dart';
import 'package:oro_gold/themes/app_colors.dart';
import 'package:oro_gold/utils/tools.dart';

class ChoosePlanScreen extends StatefulWidget {
  const ChoosePlanScreen({Key? key}) : super(key: key);

  @override
  State<ChoosePlanScreen> createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Choose Plan & Pay',
        icon: Image.asset(
          AppImages.processIcons,
          height: 25,
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close))
        ],
      ),
      body: BlocBuilder<PaymentTileBloc, PaymentTileState>(
        builder: (context, state) {
          return Column(
            children: [
               Expanded(
                child: RadioListBuilder( value:state is InformationLoadedState? state.value:null),
              ),
              const VerticalSpacing(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.tileGradient1,
                      AppColors.tileGradient2,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.checkIcon),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'no security deposit'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w800),
                          ),
                          const VerticalSpacing(height: 4),
                          const Text(
                            'Oro Safe does not charge security deposit for your lockers. ',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (state is InformationLoadedState)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            "Tax payable (${state.planModel.taxCharge}%) ${Tools.moneyFormatter(state.planModel.taxAmount)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            HexColor('#FFE9BF'),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'DURATION',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Amount ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '(incl. tax)',
                                        style: TextStyle(fontSize: 8)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacing(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${state.planModel.durationInMonths} Months',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                Tools.moneyFormatter(
                                    state.planModel.totalMaxAmount),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const VerticalSpacing(),
                          Row(
                            children: const [
                              CheckBoxState(),
                              SizedBox(width: 12),
                              Text.rich(
                                TextSpan(
                                  text: 'I agree to ',
                                  style: TextStyle(fontSize: 12),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Terms & Conditions',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        )),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              const VerticalSpacing(height: 50)
            ],
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Align(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CommonButton(
            width: double.infinity,
            callback: () {},
            text: "Confirm Plan Selection",
          ),
        )),
      ),
    );
  }
}

class CheckBoxState extends StatefulWidget {
  const CheckBoxState({Key? key}) : super(key: key);

  @override
  State<CheckBoxState> createState() => _CheckBoxStateState();
}

class _CheckBoxStateState extends State<CheckBoxState> {
  bool checkState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.0,
      width: 18.0,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.newGreen),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.transparent),
        child: Checkbox(
          activeColor: Colors.transparent,
          value: checkState,
          checkColor: AppColors.newGreen,
          onChanged: (bool? value) {
            setState(
              () {
                checkState = value ?? false;
              },
            );
          },
        ),
      ),
    );
  }
}

class RadioListBuilder extends StatefulWidget {
  final int?  value;
  const RadioListBuilder({
    Key? key, required this.value
  }) : super(key: key);

  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<RadioListBuilder> {
  final RepoProvider _repositoryProvider = RepoProvider();
  int? value;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChoosePlanModel>(
      future: _repositoryProvider.fetchPlanContents(),
      builder: (cov, AsyncSnapshot<ChoosePlanModel> snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      separatorBuilder: (_, __) {
                        return const VerticalSpacing(height: 8);
                      },
                      itemBuilder: (_, index) {
                        var choosePlanData =
                            snapshot.data?.choosePlanData?[index];

                        return RadioListTile(
                          tileColor: widget.value != index
                              ? Colors.white
                              : AppColors.lightOroYellow,
                          activeColor: AppColors.newGreen,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          value: index,
                          groupValue: widget.value,
                          onChanged: (int? ind) {
                            BlocProvider.of<PaymentTileBloc>(context).add(
                                PaymentTileTappedEvent(
                                    paymentModel:
                                        choosePlanData ?? ChoosePlanData(),
                                    value: ind ?? 0,
                                    index: index));
                          },
                          title: Row(
                            children: [
                              Text(
                                '${choosePlanData?.durationInMonths} Months',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Tools.moneyFormatter(
                                        choosePlanData?.totalAmount),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${Tools.moneyFormatter(choosePlanData?.monthlyCharge)} MONTHLY',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.newGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data?.choosePlanData?.length ?? 0,
                    )
                  : const Offstage(),
    );
  }
}
