using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers.UserAggregate
{
    public class CreateUser(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            var user = new User(notification.Account.Id);
            user.Create();
            await _userWriteRepository.CreateAsync(user, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
