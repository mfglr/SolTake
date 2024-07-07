using MySocailApp.Domain.PostAggregate;
using MySocailApp.Domain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionCreator(ITopicRepository topicRepository, IQuestionImageBlobService questionImageBlobService, ISubjectValidator validator)
    {
        private readonly ITopicRepository _topicRepository = topicRepository;
        private readonly IQuestionImageBlobService _questionImageBlobService = questionImageBlobService;
        private readonly ISubjectValidator _validator = validator;

        public async Task CreateAsync(Question question, int userId, string? content, Exam exam, Subject subject, IEnumerable<int> topicIds, IEnumerable<Stream> streams, CancellationToken cancellationToken)
        {
            if (!_validator.IsValid(exam, subject))
                throw new SubjectIsNotIncludedInExamException();
            if (!await _topicRepository.IsTopicsAvailableAsync(topicIds, cancellationToken))
                throw new TopicIsNotFoundException();
            IEnumerable<string> blobNames = await _questionImageBlobService.UpdloadAsync(streams, cancellationToken);
            question.Create(userId, content, exam, subject, topicIds, blobNames.Select(QuestionImage.Create));
        }
    }
}
