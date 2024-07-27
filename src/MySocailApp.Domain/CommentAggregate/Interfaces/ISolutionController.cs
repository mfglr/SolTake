namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface ISolutionController
    {
        Task<bool> Exist(int id,CancellationToken cancellationToken);
    }
}
