import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/color.dart';
import '../../complaint_screens/complaints_provider.dart';

class MyComplaintsDetail extends StatefulWidget {
  final int complaintsIndex;
  const MyComplaintsDetail({required this.complaintsIndex});

  @override
  _MyComplaintsDetailState createState() => _MyComplaintsDetailState();
}

class _MyComplaintsDetailState extends State<MyComplaintsDetail> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load the existing feedback if available
    final model = Provider.of<ComplaintProvider>(context, listen: false);
    final feedback = model.complaintRequests[widget.complaintsIndex].feedBack;
    if (feedback != null && feedback.isNotEmpty) {
      _feedbackController.text = feedback;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ComplaintProvider>(builder: (context, model, _) {
        return Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: PrimaryColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                const Icon(Icons.clear, color: Colors.white)),
                      ],
                    ),
                    const Text(
                      "HANGU PESCO\nCOMPLAINT DETAIL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: size.width / 1.5,
                            child: Column(
                              children: [
                                Text(
                                  "${model.complaintRequests[widget.complaintsIndex].complaintTitle}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Posted Date:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Complaint Location:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Complaint by:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Phone no:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${model.dataFormate(model.complaintRequests[widget.complaintsIndex].createdAt.toString())}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.complaintRequests[widget.complaintsIndex].complaintLocation}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.complaintRequests[widget.complaintsIndex].userName}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.complaintRequests[widget.complaintsIndex].userPhoneNo}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ExpandableJobDescription(
                          complaintDescription:
                              "${model.complaintRequests[widget.complaintsIndex].complaintDescription}",
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Complaint Image",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        model.complaintRequests[widget.complaintsIndex]
                                    .complaintImage !=
                                null
                            ? Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  image: DecorationImage(
                                      image: NetworkImage(model
                                          .complaintRequests[
                                              widget.complaintsIndex]
                                          .complaintImage
                                          .toString()) as ImageProvider,
                                      fit: BoxFit.fitWidth),
                                ),
                              )
                            : const Row(
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 20,
                                  ),
                                  Text("  Image not uploaded"),
                                ],
                              ),
                        const SizedBox(height: 10),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        model.complaintRequests[widget.complaintsIndex]
                                    .complaintStatus ==
                                "pending"
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        "Feedback ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.feedback_outlined,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: _feedbackController,
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter your feedback here...',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_feedbackController.text.isNotEmpty) {
                                        setState(() {
                                          // Update the feedback
                                          _feedbackController.text =
                                              _feedbackController.text;
                                        });
                                        model.updateFeedbackMethod(
                                          context,
                                          _feedbackController.text,
                                          model
                                              .complaintRequests[
                                                  widget.complaintsIndex]
                                              .userID
                                              .toString(),
                                          model
                                              .complaintRequests[
                                                  widget.complaintsIndex]
                                              .complaintID
                                              .toString(),
                                        );
                                      }
                                    },
                                    child: const Text('Submit Feedback'),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}



class MyMeterRequestDetail extends StatefulWidget {
  final int meterRequestIndex;
  const MyMeterRequestDetail({required this.meterRequestIndex});

  @override
  _MyMeterRequestDetailState createState() => _MyMeterRequestDetailState();
}

class _MyMeterRequestDetailState extends State<MyMeterRequestDetail> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ComplaintProvider>(builder: (context, model, _) {
        return Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: PrimaryColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                const Icon(Icons.clear, color: Colors.white)),
                      ],
                    ),
                    const Text(
                      "HANGU PESCO\nCOMPLAINT DETAIL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: size.width / 1.5,
                            child: Column(
                              children: [
                                Text(
                                  "${model.meterRequests[widget.meterRequestIndex].meterTitle}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Posted Date:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Request Location:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Request by:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Phone no:   ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${model.dataFormate(model.meterRequests[widget.meterRequestIndex].createdAt.toString())}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.meterRequests[widget.meterRequestIndex].meterLocation}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.meterRequests[widget.meterRequestIndex].userName}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${model.meterRequests[widget.meterRequestIndex].userPhoneNo}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ExpandableJobDescription(
                          complaintDescription:
                              "${model.meterRequests[widget.meterRequestIndex].meterDescription}",
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Complaint Image",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        model.meterRequests[widget.meterRequestIndex]
                                    .meterPaymentImage !=
                                null
                            ? Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  image: DecorationImage(
                                      image: NetworkImage(model
                                          .meterRequests[
                                              widget.meterRequestIndex]
                                          .meterPaymentImage
                                          .toString()) as ImageProvider,
                                      fit: BoxFit.fitWidth),
                                ),
                              )
                            : const Row(
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 20,
                                  ),
                                  Text("  Image not uploaded"),
                                ],
                              ),
                        const SizedBox(height: 10),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}




class ExpandableJobDescription extends StatefulWidget {
  final String complaintDescription;

  ExpandableJobDescription({required this.complaintDescription});

  @override
  _ExpandableJobDescriptionState createState() =>
      _ExpandableJobDescriptionState();
}

class _ExpandableJobDescriptionState extends State<ExpandableJobDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Complaint Description",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          firstChild: Text(
            widget.complaintDescription,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(widget.complaintDescription),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              isExpanded
                  ? const Text(
                      "Show less",
                      style: TextStyle(color: Colors.blue),
                    )
                  : const Text(
                      "Show more",
                      style: TextStyle(color: Colors.blue),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
