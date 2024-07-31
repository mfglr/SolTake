using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public class ConfirmEmailByTokenHandler(IAccessTokenReader tokenReader, AccountManager accountManager, IMapper mapper, UserManager<Account> userManager) : IRequestHandler<ConfirmEmailByTokenDto, AccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly AccountManager _accountManager = accountManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(ConfirmEmailByTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = (await _userManager.FindByIdAsync(accountId.ToString()))!;
            await _accountManager.ConfirmEmailByToken(account, request.Token);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
