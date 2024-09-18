using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public interface IGoogleTokenReader
    {
        Task<GoogleUser> ReadToken(string token, CancellationToken cancellationToken);
    }
}
