namespace SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts
{
    public interface IQuestionUserSaveReadRepository
    {
        Task<bool> ExistAsync(int questionId,int userId,CancellationToken cancellationToken);
    }
}
