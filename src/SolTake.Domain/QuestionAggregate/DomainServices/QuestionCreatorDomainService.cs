using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.SubjectAggregate.Exceptions;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Domain.TopicAggregate.Abstracts;
using MySocailApp.Domain.TopicAggregate.Entities;
using SolTake.Domain.ExamAggregate.Exceptions;
using SolTake.Domain.ExamAggregate.Interfaces;

namespace MySocailApp.Domain.QuestionAggregate.DomainServices
{
    public class QuestionCreatorDomainService(IExamReadRepository examReadRepository, ISubjectReadRepository subjectReadRepository, ITopicReadRepository topicReadRepository)
    {
        private readonly IExamReadRepository _examReadRepository = examReadRepository;
        private readonly ISubjectReadRepository _subjectReadRepository = subjectReadRepository;
        private readonly ITopicReadRepository _topicReadRepository = topicReadRepository;

        public async Task CreateAsync(Question question, int examId, int subjectId, int? topicId, CancellationToken cancellationToken)
        {
            var exam =
               await _examReadRepository.GetByIdAsync(examId, cancellationToken) ??
               throw new ExamNotFoundException();

            var subject =
                await _subjectReadRepository.GetByIdAsync(subjectId, cancellationToken) ??
                throw new SubjectNotFoundException();

            if (examId != subject.ExamId)
                throw new SubjectIsNotIncludedInExamException();

            Topic? topic = null;
            if (topicId != null)
            {
                if (!subject.Topics.Any(x => x.TopicId == (int)topicId))
                    throw new TopicIsNotIncludedInSubjectException();

                topic =
                    await _topicReadRepository.GetTopicById((int)topicId, cancellationToken) ??
                    throw new TopicNotFoundException();
            }

            question
                .Create(
                    new(examId, exam.ShortName, exam.FullName),
                    new(subjectId, subject.Name),
                    topic != null ? new(topic.Id, topic.Name) : null
                );
        }
    }
}
