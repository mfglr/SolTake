namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface IQuestionFinder
    {
        Task<bool> Exist(int questionId, CancellationToken cancellationToken);
    }
}
