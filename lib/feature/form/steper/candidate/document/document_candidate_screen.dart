part of '../../../../../pages.dart';

class DocumentCandidate extends StatefulWidget {
  const DocumentCandidate({super.key});

  @override
  State<DocumentCandidate> createState() => _DocumentCandidateState();
}

class _DocumentCandidateState extends State<DocumentCandidate> {
  final controller = Get.put(DocumentCandidateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Document'),
      ),
    );
  }
}
