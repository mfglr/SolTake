using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Commands.AccountAggregate.SendEmailConfirmationMail
{
    public class SendEmailConfirmationMailHandler(UserManager<Account> userManager, IEmailService emailService, IAccountAccessor accountAccessor) : IRequestHandler<SendEmailConfirmationMailDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IEmailService _emailService = emailService;
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        
        public async Task Handle(SendEmailConfirmationMailDto request, CancellationToken cancellationToken)
        {
            var account = _accountAccessor.Account;
            var token = await _userManager.GenerateEncodedEmailConfirmationTokenAsync(account);
            await _emailService.SendEmailConfirmationMail(token, account.Id, account.UserName!, account.Email!, cancellationToken);
        }
    }
}
