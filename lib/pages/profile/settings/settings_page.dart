import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fultter_courseapp/common/routes/names.dart';
import 'package:fultter_courseapp/common/values/constant.dart';
import 'package:fultter_courseapp/global.dart';
import 'package:fultter_courseapp/pages/application/bloc/app_blocs.dart';
import 'package:fultter_courseapp/pages/application/bloc/app_events.dart';
import 'package:fultter_courseapp/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:fultter_courseapp/pages/profile/settings/bloc/settings_states.dart';
import 'package:fultter_courseapp/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingsStates>(
        builder: (context, states) {
          return Container(
            child: Column(
              children: [
                settingButton(context,removeUserData)
              ],
            ),
          );
        },
      )),
    );
  }
}
