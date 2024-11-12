using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmailByToken
{
    public class VerifyEmailByTokenHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<VerifyEmailByTokenDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(VerifyEmailByTokenDto request, CancellationToken cancellationToken)
        {
            try
            {
                _accountAccessor.Account.VerifyEmailByToken(request.Token);
            }
            catch (InvalidVerificationTokenException)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
                throw;
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
