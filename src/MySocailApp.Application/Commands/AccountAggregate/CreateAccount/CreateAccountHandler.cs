using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Services;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate;
using MySocailApp.Domain.AppUserAggregate;
using System.Net;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountHandler(ITokenService tokenService, ITransactionCreator transactionCreator, UserManager<Account> userManager, IAppUserWriteRepository userRepository, IMapper mapper) : IRequestHandler<CreateAccountDto, AccountDto>
    {
        private readonly ITransactionCreator _transactionCreator = transactionCreator;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly ITokenService _tokenService = tokenService;
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(CreateAccountDto request, CancellationToken cancellationToken)
        {
            var id = Guid.NewGuid().ToString();
            var account = new Account(id);
            account.Create(request.Email);

            var user = new AppUser(id, account.UserName!);
            user.Create();

            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            await _userRepository.CreateAsync(user, cancellationToken);
            var result = await _userManager.CreateAsync(account, request.Password);
            if (!result.Succeeded)
                throw new ClientSideException(result.Errors.Select(x => x.Description).ToList(), (int)HttpStatusCode.BadRequest);
            await _userManager.AddToRoleAsync(account, Roles.USER);

            await transaction.CommitAsync(cancellationToken);

            var token = await _tokenService.CreateTokenAsync(account);
            return _mapper.Map<Account, AccountDto>(
                account,
                opt => opt.AfterMap((src, dest) => dest.Token = token)
            );

        }
    }
}
