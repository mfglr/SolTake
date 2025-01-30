using AccountDomain.AccountAggregate.Entities;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IAccountAccessor
    {
        public Account Account { get; set; }
    }
}
