using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionManager(IQuestionImageBlobService blobService, IExamRepository examRepository, ISubjectRepository subjectRepository, IQuestionImageDimentionCalculator dimentionService)
    {
        private readonly IQuestionImageBlobService _blobService = blobService;
        private readonly IExamRepository _examRepository = examRepository;
        private readonly ISubjectRepository _subjectRepository = subjectRepository;
        private readonly IQuestionImageDimentionCalculator _dimentionService = dimentionService;

        private async Task SetQuestionImages(Question question, IEnumerable<Stream> images, CancellationToken cancellationToken)
        {
            if (!images.Any())
                throw new QuestionImageIsRequiredException();
            if (images.Count() > 5)
                throw new TooManyQuestionImagesException();
            if (images.Any(image => image.Length == 0))
                throw new EmptyQuestionImageException();

            var blobNames = await _blobService.UpdloadAsync(images, cancellationToken);
            var streams = images.ToList();
            for(var i = 0; i < streams.Count;i++)
                question.AddImage(blobNames[i], _dimentionService.Calculate(streams[i]));
        }

        public async Task UpdateTopics(Question question, IEnumerable<int> topicIds, CancellationToken cancellationToken)
        {
            if (topicIds.Count() > 3)
                throw new TooManyTopicsException();

            var subject = await _subjectRepository.GetAsync(question.SubjectId, topicIds, cancellationToken);
            if (subject.Topics.Count != topicIds.Count())
                throw new TopicIsNotIncludedInSubjectException();

            question.AddNewTopics(topicIds);
        }

        public async Task CreateAsync(Question question, int userId, string? content, int examId, int subjectId, IEnumerable<int> topicIds, IEnumerable<Stream> streams, CancellationToken cancellationToken)
        {
            var exam =
                await _examRepository.GetAsync(examId, subjectId, topicIds, cancellationToken) ??
                throw new ExamIsNotFoundException();

            if (exam.Subjects.Count == 0)
                throw new SubjectIsNotIncludedInExamException();

            if (exam.Subjects.First().Topics.Count != topicIds.Count())
                throw new TopicIsNotIncludedInSubjectException();

            question.Create(userId, content, examId, subjectId);
            question.AddNewTopics(topicIds);
            await SetQuestionImages(question, streams, cancellationToken);
        }

        public Stream ReadQuestionImage(Question question, string blobName)
        {
            if (!question.HasBlobName(blobName))
                throw new InvalidBlobName(blobName);
            return _blobService.Read(blobName);
        }
    }
}
