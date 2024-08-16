// import 'package:flutter/widgets.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:my_social_app/constants/record_per_page.dart';
// import 'package:my_social_app/services/question_service.dart';
// import 'package:my_social_app/state/state.dart';

// class DispayNotitficationQuestionsPage extends StatefulWidget {
//   final int questionId;
//   const DispayNotitficationQuestionsPage({super.key,required this.questionId});

//   @override
//   State<DispayNotitficationQuestionsPage> createState() => _DispayNotitficationQuestionsPageState();
// }

// class _DispayNotitficationQuestionsPageState extends State<DispayNotitficationQuestionsPage> {

//   @override
//   void initState() {
//     final store = StoreProvider.of<AppState>(context,listen: false);
//     final accountId = store.state.accountState!.id;

//     QuestionService()
//       .getByUserId(accountId, widget.questionId - 1, questionsPerPage, true)
//       .then((questions){
//         setState(() {
          
//         });
//       });  

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }