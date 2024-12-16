using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Abstracts;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.AccountAggregate.ResetPassword
{
    public class ResetPasswordHandler(IUnitOfWork unitOfWork, IAccountWriteRepository accountWriteRepository) : IRequestHandler<ResetPasswordDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;

        public async Task Handle(ResetPasswordDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var password = new Password(request.Password);
            var passwordConfirm = new Password(request.PasswordConfirm);

            var account = 
                await _accountWriteRepository.GetAccountByEmailAsync(email, cancellationToken) ??
                throw new AccountNotFoundException();

            try
            {
                account.ResetPassword(request.Token, password, passwordConfirm);
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
