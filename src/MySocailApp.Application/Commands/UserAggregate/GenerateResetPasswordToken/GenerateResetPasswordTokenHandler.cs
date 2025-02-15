using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Exceptions;
using AccountDomain.AccountAggregate.ValueObjects;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.GenerateResetPasswordToken
{
    public class GenerateResetPasswordTokenHandler(IAccountWriteRepository accountWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<GenerateResetPasswordTokenDto>
    {
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(GenerateResetPasswordTokenDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var account =
                await _accountWriteRepository.GetAccountByEmailAsync(email, cancellationToken) ??
                throw new AccountNotFoundException();

            account.GeneratePasswordResetToken();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
