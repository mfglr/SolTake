using Orleans;
using QuestionWriteService.Domain.ValuObjects;

namespace QuestionWriteService.Application
{
    public interface IQuestionGrain : IGrainWithGuidKey
    {
        Task<Guid> Create(UserId userId, QuestionExam exam, QuestionSubject subject, IEnumerable<QuestionTopic>? topics, QuestionContent content, IEnumerable<QuestionImage> images);
        
        Task Like(UserId userId);
        Task Dislike(UserId userId);
        
        Task Save(UserId userId);
        Task Unsave(UserId userId);
        
        Task CreateComment();
        Task DeleteComment();

        Task CreateSolution();
        Task DeleteCorrectSolution();
        Task DeleteNotCorrectSolution();
    }
}
