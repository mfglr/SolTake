using MySocailApp.Domain.PostAggregate;
using MySocailApp.Domain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionManager(IQuestionImageBlobService blobService, ISubjectValidator validator, ITopicRepository repository)
    {
        private readonly IQuestionImageBlobService _blobService = blobService;
        private readonly ISubjectValidator _validator = validator;
        private readonly ITopicRepository _repository = repository;

        private async Task SetQuestionImages(Question question, IEnumerable<Stream> images,CancellationToken cancellationToken)
        {
            if (!images.Any())
                throw new NoQuestionImageException();
            if (images.Count() > 5)
                throw new TooManyQuestionImagesException();
            if (images.Any(image => image.Length == 0))
                throw new EmptyQuestionImageException();

            var blobNames = await _blobService.UpdloadAsync(images, cancellationToken);
            question.AddImages(blobNames);
        }

        public async Task SetTopics(Question question, IEnumerable<int> topicIds, CancellationToken cancellationToken)
        {
            if (!topicIds.Any()) return;

            var topics = await _repository.GetTopicsAsync(topicIds, cancellationToken);
            if (topicIds.Count() != topics.Count)
                throw new TopicIsNotFoundException();

            foreach (var topic in topics)
                if ((int)topic.Exam != (int)question.Exam || (int)topic.Subject != (int)question.Subject)
                    throw new InvalidTopicException();

            question.AddNewTopics(topicIds);
        }

        public async Task CreateAsync(Question question, int userId, string? content, QuestionExam exam, QuestionSubject subject, IEnumerable<int> topicIds, IEnumerable<Stream> streams, CancellationToken cancellationToken)
        {
            if (!_validator.IsValid(exam, subject))
                throw new SubjectIsNotIncludedInExamException();

            question.Create(userId, content, exam, subject);
            await SetTopics(question, topicIds, cancellationToken);
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
