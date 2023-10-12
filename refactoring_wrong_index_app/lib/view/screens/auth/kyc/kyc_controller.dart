import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class KycController extends GetxController{
  List<File> kycDocFiles = [];
  File? uploadDrivingLicense;
  File? uploadPassport;
  File? uploadNid;
  String drivingLicenseFileName = "";
  String passportFileName = "";
  String nidFileName = "";

  Future<void> pickDrivingLicenceFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf","png","jpg","jpeg"], type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadDrivingLicense = File(result.files.single.path.toString());
      kycDocFiles.add(uploadDrivingLicense!);
      update();
    }
  }

  Future<void> pickPassportFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf","png","jpg","jpeg"], type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadPassport = File(result.files.single.path.toString());
      //passportFileName = result.files.single.name;
      kycDocFiles.add(uploadPassport!);
      update();
    }
  }

  Future<void> pickNidFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf","png","jpg","jpeg"], type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      uploadNid = File(result.files.single.path.toString());
      //passportFileName = result.files.single.name;
      kycDocFiles.add(uploadNid!);
      update();
    }
  }

  void removeDrivingLicenceFile() {
    uploadDrivingLicense = null;
    drivingLicenseFileName = "";
    kycDocFiles.removeAt(0);
    update();
  }

  void removePassportFile() {
    uploadPassport = null;
    passportFileName = "";
    kycDocFiles.removeAt(1);
    update();
  }

  void removeNidFile() {
    uploadNid = null;
    nidFileName = "";
    kycDocFiles.removeAt(2);
    update();
  }
}