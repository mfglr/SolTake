using MySocailApp.Domain.ExamAggregate.Exceptions;
using MySocailApp.Domain.ExamAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
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

        public async Task CreateAsync(Question question, int examId, int subjectId, int topicId, CancellationToken cancellationToken)
        {
            var exam =
                await _examRepository.GetByIdAsync(examId, cancellationToken) ??
                throw new ExamNotFoundException();
            var subject =
                await _subjectRepository.GetSubjectWithTopicByIdAsync(subjectId, topicId, cancellationToken) ??
                throw new SubjectNotFoundException();
            var topic =
                await _topicRepository.GetTopicById(topicId, cancellationToken) ??
                throw new TopicNotFoundException();
            
            if (examId != subject.ExamId)
                throw new SubjectIsNotIncludedInExamException();
            
            if (subject.Topics.Count == 0)
                throw new TopicIsNotIncludedInSubjectException();
            
            question
                .Create(
                    new(exam.Id, exam.ShortName, exam.FullName),
                    new(subject.Id, subject.Name),
                    new(topic.Id, topic.Name)
                );
        }
    }
}
