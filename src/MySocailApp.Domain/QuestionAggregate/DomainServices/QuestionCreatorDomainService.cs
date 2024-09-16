using MySocailApp.Domain.ExamAggregate.Exceptions;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SubjectAggregate.Exceptions;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.TopicAggregate.Interfaces;

namespace MySocailApp.Domain.QuestionAggregate.DomainServices
{
    public class QuestionCreatorDomainService(IExamReadRepository examRepository, ISubjectReadRepository subjectRepository, ITopicReadRepository topicRepository)
    {
        private readonly IExamReadRepository _examRepository = examRepository;
        private readonly ISubjectReadRepository _subjectRepository = subjectRepository;
        private readonly ITopicReadRepository _topicRepository = topicRepository;

        public async Task CreateAsync(Question question, int userId, QuestionContent content, int examId, int subjectId, IEnumerable<int> topicIds, IEnumerable<QuestionImage> images, CancellationToken cancellationToken)
        {
            var exam =
                await _examRepository.GetByIdAsync(examId, cancellationToken) ??
                throw new ExamNotFoundException();
            
            var subject =
                await _subjectRepository.GetByIdAsync(subjectId, cancellationToken) ??
                throw new SubjectNotFoundException();
            
            if (examId != subject.ExamId)
                throw new SubjectIsNotIncludedInExamException();

            var topics = await _topicRepository.GetByTopicIds(topicIds, cancellationToken);
            if (topics.Count != topics.Count)
                throw new TopicNotFoundException();
            
            if(topics.Any(x => x.SubjectId != subjectId))
                throw new TopicIsNotIncludedInSubjectException();

            question.Create(userId, content, examId, subjectId, topicIds, images);
        }
    }
}
