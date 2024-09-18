namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public interface IFaceBookTokenReader
    {
        Task<string> ReadUserId(string accessToken, CancellationToken cancellationToken);
    }
}
