import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/color.dart';
import '../../complaint_screens/complaints_provider.dart';
import 'my_complaints_detail.dart';

class MyComplaints extends StatelessWidget {
  int? currentIndex;

  MyComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplaintProvider>(builder: (context, model, child) {
      Size size = MediaQuery.of(context).size;
      return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "My Complaints",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: PrimaryColor,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                unselectedLabelStyle: TextStyle(color: Colors.white54),
                tabs: [
                  Tab(text: "My Complaints"),
                  Tab(text: "My Meter Requests"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                /// First tab content: My Complaints
                model.isLoading
                    ? Container(
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: PrimaryColor,
                    ),
                  ),
                )
                    : model.complaintRequests.isNotEmpty
                    ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: model.complaintRequests.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyComplaintsDetail(
                                      complaintsIndex: index,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  blurRadius: 3,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "${model.complaintRequests[index].complaintTitle}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.2,
                                          ),
                                          model.complaintRequests[
                                          index]
                                              .inProgress ==
                                              "inProgress"
                                              ? Text(
                                            "${model.complaintRequests[index].inProgress} ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blue
                                                  .shade900,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                            ),
                                          )
                                              : SizedBox(),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Complaint Date: ",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            model.dataFormate(model
                                                .complaintRequests[
                                            index]
                                                .createdAt
                                                .toString()),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      model.complaintRequests[index]
                                          .complaintStatus ==
                                          "pending"
                                          ? const Text(
                                        "Pending...",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                          : model
                                          .complaintRequests[
                                      index]
                                          .complaintStatus ==
                                          "approved"
                                          ? const Text(
                                        "Approved",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            color: Colors
                                                .green),
                                      )
                                          : const Text(
                                        "Rejected",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            color:
                                            Colors.red),
                                      ),
                                    ],
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
                          style: TextStyle(
                              fontSize: 16, color: PrimaryColor),
                        ))),



                /// Second tab content: My Meter Requests
                model.isLoading
                    ? Container(
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: PrimaryColor,
                    ),
                  ),
                )
                    : model.meterRequests.isNotEmpty
                    ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: model.meterRequests.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyMeterRequestDetail(
                                      meterRequestIndex: index,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  blurRadius: 3,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "${model.meterRequests[index].meterTitle}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.2,
                                          ),
                                         SizedBox(),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Request Date: ",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            model.dataFormate(model
                                                .meterRequests[
                                            index]
                                                .createdAt
                                                .toString()),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      model.meterRequests[index]
                                          .meterStatus ==
                                          "pending"
                                          ? const Text(
                                        "Pending...",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                          : model
                                          .meterRequests[
                                      index]
                                          .meterStatus ==
                                          "approved"
                                          ? const Text(
                                        "Approved",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            color: Colors
                                                .green),
                                      )
                                          : const Text(
                                        "Rejected",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            color:
                                            Colors.red),
                                      ),
                                    ],
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
                          "No Request...\n\n\n\n\n\n",
                          style: TextStyle(
                              fontSize: 16, color: PrimaryColor),
                        ))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
