using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Services
{
    public interface IAccountAccessor
    {
        Account Account { get; set; }
    }
}
