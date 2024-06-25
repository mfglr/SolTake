using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountByEmail
{
    public class GetAccountByEmailHandler(IMapper mapper, UserManager<Account> userManager) : IRequestHandler<GetAccountByEmailDto, AccountResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task<AccountResponseDto> Handle(GetAccountByEmailDto request, CancellationToken cancellationToken)
        {
            var account = await _userManager.FindByEmailAsync(request.Email) ?? throw new AccountWasNotFoundException();
            return _mapper.Map<AccountResponseDto>(account);
        }
    }
}
