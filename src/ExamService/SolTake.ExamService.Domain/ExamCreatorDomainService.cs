namespace SolTake.ExamService.Domain
{
    public class ExamCreatorDomainService(IExamRepository examRepository)
    {
        private readonly IExamRepository _examRepository = examRepository;

        public async Task CreateAsync(Exam exam,CancellationToken cancellationToken)
        {
            if (await _examRepository.ExistAsync(exam.Name, cancellationToken))
                throw new ExamAlreadyExsistException();
            exam.Create();
        }
    }
}
