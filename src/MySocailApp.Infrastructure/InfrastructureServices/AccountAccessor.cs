using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class AccountAccessor : IAccountAccessor
    {
        public Account Account { get; set; }
    }
}
