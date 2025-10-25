namespace SolTake.SubjectService.Domain
{
    public class SubjectCreator(ISubjectRepository subjectRepository)
    {
        private readonly ISubjectRepository _subjectRepository = subjectRepository;

        public async Task CreateAsync(Subject subject, CancellationToken cancellationToken)
        {
            if (await _subjectRepository.ExistAsync(subject.Name, cancellationToken))
                throw new Exception("The subject name has already been taken.");
            subject.Create();
        }
    }
}
