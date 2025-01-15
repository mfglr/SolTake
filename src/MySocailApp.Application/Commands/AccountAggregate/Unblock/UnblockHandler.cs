using AccountDomain.Abstracts;
using AccountDomain.Exceptions;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.Unblock
{
    public class UnblockHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork, IAccountWriteRepository accountWriteRepository) : IRequestHandler<UnblockDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task Handle(UnblockDto request, CancellationToken cancellationToken)
        {
            var blocked = 
                await _accountWriteRepository.GetAccountAsync(request.BlockedId, cancellationToken) ??
                throw new AccountNotFoundException();
            blocked.Unblock(_accountAccessor.Account.Id);
            
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
