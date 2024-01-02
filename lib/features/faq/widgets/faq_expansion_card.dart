import 'package:flutter/material.dart';
import 'package:tollhopper/features/faq/widgets/faq_expansion_body.dart';

import 'faq_expansion_header.dart';

class FAQExpansionCard extends StatefulWidget {
  final String question;
  final String description;
  final List<Widget>? body;
  final bool isExpanded;

  const FAQExpansionCard({
    Key? key,
    this.body,
    required this.question,
    required this.description,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<FAQExpansionCard> createState() => _FAQExpansionCardState();
}

class _FAQExpansionCardState extends State<FAQExpansionCard> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          FAQExpansionCardHeader(
            onTap: openCloseCard,
            isExpanded: isExpanded,
            question: widget.question,
          ),
          isExpanded
              ? FAQExpansionCardBody(
                  description: widget.description,
                  body: widget.body,
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void openCloseCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
