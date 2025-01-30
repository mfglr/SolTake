using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.DomainEvents;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.DeleteAccount
{
    public class DeleteAccountHandler(IPublisher publisher, IAccountAccessor accountAccessor, IAccountWriteRepository accountWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IPublisher _publisher = publisher;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            _accountWriteRepository.Delete(_accountAccessor.Account);
            await _unitOfWork.CommitAsync(cancellationToken);
            
            await _publisher.Publish(new AccountDeletedDomainEvent(_accountAccessor.Account), cancellationToken);
        }
    }
}
