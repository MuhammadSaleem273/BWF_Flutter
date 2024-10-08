import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../core/color/color.dart';
import '../core/enums/view_state.dart';
import 'all_complaints_provider.dart';
import 'complaints_detail.dart';

class PendingComplaints extends StatelessWidget {
  int? currentIndex;

  PendingComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllComplaintProvider>(builder: (context, model, child) {
      Size size = MediaQuery.of(context).size;
      return ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: PrimaryColor,
        ),
        inAsyncCall: model.state == ViewState.busy,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Pending Complaints",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
              ),
              body: model.pendingComplaints.length != 0
                  ? SizedBox(
                      height: size.height,
                      child: ListView.builder(
                        itemCount: model.pendingComplaints.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                currentIndex = index;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PendingComplaintsDetail(
                                      ComplaintsIndex: currentIndex,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${model.pendingComplaints[index].complaintTitle}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Posted Date: ",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${model.dataFormate(model.pendingComplaints[index].createdAt.toString())}",
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.1,
                                            top: 10,
                                            bottom: 5,
                                            right: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  model.updateComplaintRequest(
                                                      context,
                                                      "approved",
                                                      model.complaintModel,
                                                      index);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: const Center(
                                                      child: Text(
                                                    "Confirm",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  model.updateComplaintRequest(
                                                      context,
                                                      "rejected",
                                                      model.complaintModel,
                                                      index);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: const Center(
                                                      child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child:

                                        model
                                            .pendingComplaints[
                                        index]
                                            .inProgress ==
                                            "inProgress"
                                            ? const Center(
                                              child: Text(" Complaint is in progress",
                                                                                        style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                Colors.green),
                                                                                      ),
                                            ):
                                        InkWell(
                                          onTap: () async {
                                            model.updateComplaintInProgress(
                                                context,
                                                "inProgress",
                                                model.complaintModel,
                                                index);
                                          },
                                          child: Container(
                                              width: 120,
                                              height: 25,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 3),
                                              margin:
                                                  const EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Center(
                                                  child:  Text(
                                                          "add to progress",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black),
                                                        )
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                          child: Text(
                        "No Complaints...\n\n\n\n\n\n",
                        style: TextStyle(fontSize: 16, color: PrimaryColor),
                      )))),
        ),
      );
    });
  }
}
