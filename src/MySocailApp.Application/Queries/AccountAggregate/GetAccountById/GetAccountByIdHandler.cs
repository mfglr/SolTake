using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Queries.AccountAggregate.GetAccountById
{
    public class GetAccountByIdHandler(IMapper mapper, UserManager<Account> userManager) : IRequestHandler<GetAccountByIdDto, AccountResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly UserManager<Account> _userManager = userManager;

        public async Task<AccountResponseDto> Handle(GetAccountByIdDto request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByIdAsync(request.Id) ?? throw new AccountWasNotFoundException();
            return _mapper.Map<AccountResponseDto>(user);
        }
    }
}
