import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/services/network_services.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/base_view_model.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../../core/models/complaint_model.dart';
import '../core/enums/view_state.dart';
import '../core/models/meter_request_model.dart';

class AllComplaintProvider extends BaseViewModal {
  final formKey = GlobalKey<FormState>();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();
  ComplaintModel complaintModel = ComplaintModel();
  MeterRequestModel meterRequestModel = MeterRequestModel();

  AllComplaintProvider() {
    getAllComplaints();
    getMeterRequest();
  }

  List<ComplaintModel> pendingComplaints = [];
  List<ComplaintModel> urgentPendingComplaints = [];
  List<MeterRequestModel> meterRequest = [];
  List<ComplaintModel> approvedComplaints = [];
  List<ComplaintModel> rejectComplaints = [];
  Stream<QuerySnapshot>? complaintStream;
  Stream<QuerySnapshot>? requestStream;

  /// Get All Complaints ======>>>>
  void getAllComplaints() async {
    complaintStream = await databaseServices.getAllUserComplaints();
    complaintStream!.listen((event) {
      pendingComplaints = [];
      urgentPendingComplaints = [];
      approvedComplaints = [];
      rejectComplaints = [];

      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          final post = ComplaintModel.fromJson(element.data());
          if (post.complaintStatus == 'pending' &&
              post.complaintTitle != "Meter Sparking/Wire Loose") {
            pendingComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintTitle == "Meter Sparking/Wire Loose" ||
              post.complaintStatus == "pending" &&
                  post.complaintStatus == "approved") {
            urgentPendingComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintStatus == 'approved' &&
              post.complaintTitle != "Meter Sparking/Wire Loose") {
            approvedComplaints.add(post);
            notifyListeners();
          }
          if (post.complaintTitle == 'Meter Sparking/Wire Loose') {
            rejectComplaints.add(post);
            notifyListeners();
          }
        });
      }
    });
    notifyListeners();
  }

  /// Get Meter Complaints ======>>>>
  void getMeterRequest() async {
    requestStream = await databaseServices.getAllMeterRequests();
    requestStream!.listen((event) {
      meterRequest = [];

      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          final post = MeterRequestModel.fromJson(element.data());
          meterRequest.add(post);
          notifyListeners();
        });
      }
    });
    notifyListeners();
  }

  /// Update Complaint Function ========>>>
  updateComplaintRequest(BuildContext context, String complaintStatus,
      ComplaintModel complaintModel, int index) async {
    setState(ViewState.busy);
    try {
      await NetworkServices.sendNotification(
          title: pendingComplaints[index].complaintTitle,
          token: pendingComplaints[index].fcmToken,
          body: "your complaint has been $complaintStatus ..");
      // print(complaintStatus);
      complaintModel.complaintStatus = complaintStatus;

      await databaseServices.UpdateComplaints(
          complaintModel,
          pendingComplaints[index].complaintID,
          pendingComplaints[index].userID);
      print("Request Status $complaintStatus");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('complaint request $complaintStatus successfully!'),
        ),
      );
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }

  /// Update Complaint Function ========>>>
  updateComplaintInProgress(BuildContext context, String inProgress,
      ComplaintModel complaintModel, int index) async {
    setState(ViewState.busy);
    try {
      await NetworkServices.sendNotification(
          title: pendingComplaints[index].complaintTitle,
          token: pendingComplaints[index].fcmToken,
          body: "your complaint is in progress...");
      // print(complaintStatus);
      complaintModel.inProgress = inProgress;

      await databaseServices.UpdateInProgress(
          complaintModel,
          pendingComplaints[index].complaintID,
          pendingComplaints[index].userID);

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('complaint added to progress!'),
        ),
      );
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);
    }
  }

  /// emergency Request Function ========>>>
  updateUrgentComplaintRequest(BuildContext context, String complaintStatus,
      ComplaintModel complaintModel, int index) async {
    setState(ViewState.busy);

    try {
      await NetworkServices.sendNotification(
          title: urgentPendingComplaints[index].complaintTitle,
          token: urgentPendingComplaints[index].fcmToken,
          body: "your complaint has been $complaintStatus ..!");

      print("2222222222222");
      print(complaintStatus);
      complaintModel.complaintStatus = complaintStatus;

      await databaseServices.UpdateComplaints(
          complaintModel,
          urgentPendingComplaints[index].complaintID,
          urgentPendingComplaints[index].userID);
      print("Request Status $complaintStatus");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('complaint request $complaintStatus successfully!'),
        ),
      );
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }

  /// Update Request Function ========>>>
  updateMeterRequest(BuildContext context, String meterStatus,
      MeterRequestModel meterRequestModel, int index) async {
    setState(ViewState.busy);
    try {
      await NetworkServices.sendNotification(
          title: meterRequest[index].meterTitle,
          token: meterRequest[index].fcmToken,
          body: "your meter requests has been $meterStatus ..");
      print(meterStatus);
      meterRequestModel.meterStatus = meterStatus;

      await databaseServices.UpdateMeterRequest(meterRequestModel,
          meterRequest[index].meterID, meterRequest[index].userID);
      print("<Meter> Status $meterStatus");

      setState(ViewState.idle);

      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Meter request $meterStatus successfully!'),
        ),
      );
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);

      print("Error in update complaint request: $e");
    }
  }

  /// Date Format Method >>>>
  String dataFormate(String date) {
    DateTime inputDate = DateTime.parse(date);
    String formattedDate = DateFormat('d MMM yyyy', 'en_US').format(inputDate);
    return formattedDate;
  }
}
