using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailHandler(IMapper mapper, IAccessTokenReader tokenReader, AccountManager accountManager, UserManager<Account> userManager) : IRequestHandler<UpdateEmailDto, AccountDto>
    {
        private readonly AccountManager _accountManager = accountManager;
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(UpdateEmailDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = 
                await _userManager.FindByIdAsync(accountId.ToString()) ?? 
                throw new AccountNotFoundException();

            await _accountManager.UpdateEmailAsync(account, request.Email);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
