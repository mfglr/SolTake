using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.SendPasswordResetMail
{
    public class SendPasswordResetMailHandler(UserManager<Account> userManager, IEmailService emailService) : IRequestHandler<SendPasswordResetMailDto>
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(SendPasswordResetMailDto request, CancellationToken cancellationToken)
        {
            var user = 
                await _userManager.FindByEmailAsync(request.Email) ??
                throw new AccountNotFoundException();

            //var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            //await _emailService.)
        }
    }
}
