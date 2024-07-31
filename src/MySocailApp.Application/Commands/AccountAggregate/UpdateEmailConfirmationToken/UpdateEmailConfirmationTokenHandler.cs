using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmailConfirmationToken
{
    public class UpdateEmailConfirmationTokenHandler(IAccessTokenReader tokenReader, UserManager<Account> userManager, IMapper mapper) : IRequestHandler<UpdateEmailConfirmationTokenDto, AccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(UpdateEmailConfirmationTokenDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account = (await _userManager.FindByIdAsync(accountId.ToString()))!;
            account.UpdateEmailConfirmationToken();
            await _userManager.UpdateAsync(account);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
