using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Infrastructure.Services
{
    public class AccountAccessor : IAccountAccessor
    {
        public Account Account { get; set; }
    }
}
