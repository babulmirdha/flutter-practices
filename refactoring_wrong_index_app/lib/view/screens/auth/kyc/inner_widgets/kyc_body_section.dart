import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../widgets/text/custom_text.dart';
import '../../../../widgets/text_field/custom_text_field.dart';

class KycBodySection extends StatefulWidget {

  const KycBodySection({super.key});

  @override
  State<KycBodySection> createState() => _KycBodySectionState();
}

class _KycBodySectionState extends State<KycBodySection> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<KycController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Upload Driving License",
                bottom: 12,
                textAlign: TextAlign.start,
              ),
              controller.uploadDrivingLicense == null ? GestureDetector(
                onTap: () => controller.pickDrivingLicenceFile(),
                child: Container(
                  height: 115, width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                ),
              ) : Container(
                padding: const EdgeInsetsDirectional.only(end: 12),
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD7263D),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          controller.drivingLicenseFileName,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2C2C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => controller.removeDrivingLicenceFile(),
                      child: const Icon(Icons.cancel_outlined, color: AppColors.redNormal, size: 24),
                    )
                  ],
                ),
              ),
              const CustomText(
                text: "Upload NID Card",
                bottom: 12,
                textAlign: TextAlign.start,
              ),
              controller.uploadNid == null ? GestureDetector(
                onTap: () => controller.pickNidFile(),
                child: Container(
                  height: 115, width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                ),
              ) : Container(
                padding: const EdgeInsetsDirectional.only(end: 12),
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD7263D),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          controller.drivingLicenseFileName,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2C2C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => controller.removeNidFile(),
                      child: const Icon(Icons.cancel_outlined, color: AppColors.redNormal, size: 24),
                    )
                  ],
                ),
              ),
              const CustomText(
                text: "Upload INE/Passport",
                top: 16,
                bottom: 12,
                textAlign: TextAlign.start,
              ),
              controller.uploadPassport == null ? GestureDetector(
                onTap: () => controller.pickPassportFile(),
                child: Container(
                  height: 115, width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                ),
              ) : Container(
                padding: const EdgeInsetsDirectional.only(end: 12),
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: const Color(0xFFCCCCCC)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD7263D),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: SvgPicture.network("https://www.svgrepo.com/show/33873/pdf.svg"),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          controller.passportFileName,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF2E2C2C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => controller.removePassportFile(),
                      child: const Icon(Icons.cancel_outlined, color: AppColors.redNormal, size: 24),
                    )
                  ],
                ),
              ),
              const CustomText(
                text: AppStrings.inePassword,
                top: 16,
                bottom: 12,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                textInputAction: TextInputAction.done,
                hintText: AppStrings.enterIne,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteNormalActive
                ),
              ),
            ],
          ),
          const SizedBox(height: 190),
          CustomElevatedButton(
              buttonWidth: MediaQuery.of(context).size.width,
              onPressed: (){

              },
              titleText: "Continue"
          )
        ],
      )
    );
  }
}
