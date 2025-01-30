using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.DomainServices;
using AccountDomain.AccountAggregate.Entities;
using AccountDomain.AccountAggregate.ValueObjects;
using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountHandler(IMapper mapper, AccountCreatorDomainService accountCreatorDomainService, IHttpContextAccessor contextAccessor, IAccountWriteRepository accountWriteRepository, IUnitOfWork unitOfWork, AccessTokenSetterDomainService accessTokenSetterDomainService, RefreshTokenSetterDomainService refreshTokenSetterDomainService) : IRequestHandler<CreateAccountDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly AccountCreatorDomainService _accountCreatorDomainService = accountCreatorDomainService;
        private readonly AccessTokenSetterDomainService _accessTokenSetterDomainService = accessTokenSetterDomainService;
        private readonly RefreshTokenSetterDomainService _refreshTokenSetterDomainService = refreshTokenSetterDomainService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<AccountDto> Handle(CreateAccountDto request, CancellationToken cancellationToken)
        {
            var email = new Email(request.Email);
            var password = new Password(request.Password);
            var passwordConfirm = new Password(request.PasswordConfirm);
            var language = new Language(_contextAccessor.HttpContext.GetLanguage());

            var account = new Account(email, password, passwordConfirm, language);
            await _accountCreatorDomainService.CreateAsync(account, cancellationToken);
            await _accountWriteRepository.CreateAsync(account, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            await _accessTokenSetterDomainService.SetAsync(account, cancellationToken);
            _refreshTokenSetterDomainService.Set(account);

            return _mapper.Map<AccountDto>(account);
        }
    }
}
