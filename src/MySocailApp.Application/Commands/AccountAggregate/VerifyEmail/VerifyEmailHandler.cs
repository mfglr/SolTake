using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.VerifyEmail
{
    public class VerifyEmailHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork) : IRequestHandler<VerifyEmailDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(VerifyEmailDto request, CancellationToken cancellationToken)
        {
            try
            {
                _accountAccessor.Account.VerifyEmail(request.Token);
            }
            catch (InvalidTokenException)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
                throw;
            }
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
