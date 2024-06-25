using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountByUserName
{
    public class GetAccountByUserNameHandler(IMapper mapper, UserManager<Account> userManager) : IRequestHandler<GetAccountByUserNameDto, AccountResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task<AccountResponseDto> Handle(GetAccountByUserNameDto request, CancellationToken cancellationToken)
        {
            var account = await _userManager.FindByNameAsync(request.UserName) ?? throw new AccountWasNotFoundException();
            return _mapper.Map<AccountResponseDto>(account);
        }
    }
}
