using Orleans;
using QuestionWriteService.Application;
using QuestionWriteService.Domain;
using QuestionWriteService.Domain.ValuObjects;

namespace QuestionWriteService.Infrastructure
{
    public class QuestionGrain : Grain, IQuestionGrain
    {
        private QuestionState _state;

        public Task<Guid> Create(UserId userId, QuestionExam exam, QuestionSubject subject, IEnumerable<QuestionTopic>? topics, QuestionContent content, IEnumerable<QuestionImage> images)
        {
            _state = new QuestionState(userId, exam, subject, topics, content, images);
            _state.Create();
            return Task.FromResult(this.GetPrimaryKey());
        }
        
        public Task Like(UserId userId)
        {
            _state.Like(userId);
            return Task.CompletedTask;
        }
        public Task Dislike(UserId userId)
        {
            _state.Dislike(userId);
            return Task.CompletedTask;
        }

        public Task Save(UserId userId)
        {
            _state.Save(userId);
            return Task.CompletedTask;
        }
        public Task Unsave(UserId userId)
        {
            _state.Unsave(userId);
            return Task.CompletedTask;
        }

        public Task CreateComment()
        {
            _state.CreateComment();
            return Task.CompletedTask;
        }
        public Task DeleteComment()
        {
            _state.DeleteComment();
            return Task.CompletedTask;
        }

        public Task CreateSolution()
        {
            _state.CreateSolution();
            return Task.CompletedTask;
        }
        public Task DeleteCorrectSolution()
        {
            _state.DeleteCorrectSolution();
            return Task.CompletedTask;
        }
        public Task DeleteNotCorrectSolution()
        {
            _state.DeleteNotCorrectSolution();
            return Task.CompletedTask;
        }
    }
}
