//using SolTake.QuestionService.Domain.Abstracts;
//using SolTake.QuestionService.Domain.Entities;

//namespace SolTake.QuestionService.Domain.DomainServices
//{
//    public class QuestionCreator(IExamService examService)
//    {
//        private readonly IExamService _examService = examService;

//        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
//        {
//            if (!await _examService.ExistAsync(question.ExamName.Value, cancellationToken))
//                throw new Exception("Exam not found.");
           
//            question.Create();
//        }


//    }
//}
