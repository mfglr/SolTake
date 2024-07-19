using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Repositories;

namespace MySocailApp.Domain.QuestionAggregate.DomainServices
{
    public class QuestionCreatorDomainService(IExamRepositoryQA examRepository, ISubjectRepositoryQA subjectRepository, ITopicRepositoryQA topicRepository)
    {
        private readonly IExamRepositoryQA _examRepository = examRepository;
        private readonly ISubjectRepositoryQA _subjectRepository = subjectRepository;
        private readonly ITopicRepositoryQA _topicRepository = topicRepository;

        public async Task CreateAsync(Question question, int userId, string? content, int examId, int subjectId, IEnumerable<int> topicIds, IEnumerable<QuestionImage> images, CancellationToken cancellationToken)
        {
            var exam =
                await _examRepository.GetAsync(examId, cancellationToken) ??
                throw new ExamIsNotFoundException();
            
            var subject =
                await _subjectRepository.GetByIdAsync(subjectId, cancellationToken) ??
                throw new SubjectIsNotFoundException();
            
            if (examId != subject.ExamId)
                throw new SubjectIsNotIncludedInExamException();

            var topics = await _topicRepository.GetByTopicIds(topicIds, cancellationToken);
            if (topics.Count != topics.Count)
                throw new TopicIsNotFoundException();
            
            if(topics.Any(x => x.SubjectId != subjectId))
                throw new TopicIsNotIncludedInSubjectException();

            question.Create(userId, content, examId, subjectId, topicIds, images);
        }
    }
}
