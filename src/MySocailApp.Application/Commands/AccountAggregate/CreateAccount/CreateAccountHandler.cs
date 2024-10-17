using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountHandler(IMapper mapper, AccountCreatorDomainService accountManager, IHttpContextAccessor contextAccessor) : IRequestHandler<CreateAccountDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly AccountCreatorDomainService _accountManager = accountManager;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;

        public async Task<AccountDto> Handle(CreateAccountDto request, CancellationToken cancellationToken)
        {
            var account = new Account(request.Email, false, _contextAccessor.HttpContext.GetLanguage());
            await _accountManager.CreateAsync(account, request.Password, request.PasswordConfirm, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
