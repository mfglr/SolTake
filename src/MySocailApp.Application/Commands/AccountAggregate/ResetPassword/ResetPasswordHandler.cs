using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.ResetPassword
{
    public class ResetPasswordHandler(UserManager<Account> userManager, PasswordResetterDomainService passwordResetterDomainService) : IRequestHandler<ResetPasswordDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly PasswordResetterDomainService _passwordResetterDomainService = passwordResetterDomainService;

        public async Task Handle(ResetPasswordDto request, CancellationToken cancellationToken)
        {
            var account =
                await _userManager.FindByEmailAsync(request.Email) ??
                throw new AccountNotFoundException();

            await _passwordResetterDomainService.ResetAsync(account, request.Token, request.Password, request.PasswordConfirm);
        }
    }
}
