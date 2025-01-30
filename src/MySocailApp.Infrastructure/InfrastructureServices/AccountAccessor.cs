using AccountDomain.AccountAggregate.Entities;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class AccountAccessor : IAccountAccessor
    {
        public Account Account { get; set; }
    }
}
