using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.SendEmailConfirmationMail
{
    public class SendEmailConfirmationMailHandler(UserManager<Account> userManager, IEmailService emailService, IAccessTokenReader tokenReader) : IRequestHandler<SendEmailConfirmationMailDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IEmailService _emailService = emailService;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        
        public async Task Handle(SendEmailConfirmationMailDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = 
                await _userManager.Users.FirstOrDefaultAsync(x => x.Id == accountId && !x.IsRemoved, cancellationToken) ??
                throw new AccountNotFoundException();

            var token = await _userManager.GenerateEncodedEmailConfirmationTokenAsync(account);
            await _emailService.SendEmailConfirmationMail(token, account.Id, account.UserName!, account.Email!, cancellationToken);
        }
    }
}
