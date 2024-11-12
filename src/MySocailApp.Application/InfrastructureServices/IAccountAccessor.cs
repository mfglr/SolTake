using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IAccountAccessor
    {
        Account Account { get; set; }
    }
}
