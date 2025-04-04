import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrayo_flutter/config/app_utils.dart';
import 'package:zrayo_flutter/config/helper.dart';
import 'package:zrayo_flutter/core/utils/routing/routes.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/create_profile_provider.dart';
import 'package:zrayo_flutter/feature/auth/presentation/provider/states/create_profile_states.dart';
import 'package:zrayo_flutter/feature/auth/presentation/views/create_profile_steps/upload_document_tile.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/camera_bottom_sheet_view.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/common_dotted_border.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_app_bar.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_btn.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

class UploadDocument extends ConsumerWidget {
  final bool fromSettings;

  const UploadDocument({super.key, required this.fromSettings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProfileState = ref.watch(createProfileProvider);
    final createProfileNotifier = ref.read(createProfileProvider.notifier);

    ref.listen<CreateProfileStates>(createProfileProvider, (previous, next) {
      if (next is CreateProfileSuccess) {
        fromSettings ? back(context) : toNamed(context, Routes.addAddressView);
      } else if (next is CreateProfileFailed) {
        toast(msg: next.error, isError: true);
      }
    });
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title: fromSettings
                  ? AppString.identityDocument
                  : AppString.uploadDocument),
          yHeight(10.sp),
          fromSettings
              ? SizedBox()
              : Container(
                  height: 5,
                  color: AppColor.orangeFff9f0,
                  width: screenWidth(context),
                  child: Row(
                    children: [
                      Container(
                        height: 5,
                        width: (screenWidth(context) / 5) * 3,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  yHeight(40.sp),
                  CommonDottedBorder(
                    child: UploadDocumentTile(
                      filePath: createProfileNotifier.uploadDocFrontFile?.path ?? "",
                      title: AppString.uploadIdentityDocument,
                      subTitle: AppString.frontSide,
                      onTap: () {
                        Utils.appBottomSheet(
                          widget: CameraBottomSheetView(
                            onGetImage: (value) {
                              createProfileNotifier
                                  .changeUploadFrontImage(value);
                            },
                            title: AppString.uploadFrontSide,
                          ),
                          context: context,
                        );
                      },
                    ),
                  ),
                  yHeight(40.sp),
                  CommonDottedBorder(
                    child: UploadDocumentTile(
                      filePath: createProfileNotifier.uploadDocBackFile?.path,
                      title: AppString.uploadIdentityDocument,
                      subTitle: AppString.backSide,
                      onTap: () {
                        Utils.appBottomSheet(
                          widget: CameraBottomSheetView(
                            onGetImage: (value) {
                              createProfileNotifier
                                  .changeUploadBackImage(value);
                            },
                            title: AppString.uploadBackSide,
                          ),
                          context: context,
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  CommonAppBtn(
                    loading: createProfileState is CreateProfileApiLoading,
                    title: fromSettings
                        ? AppString.update
                        : AppString.saveAndContinue,
                    onTap: () => createProfileNotifier.uploadDocument(),
                  ),
                  yHeight(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
