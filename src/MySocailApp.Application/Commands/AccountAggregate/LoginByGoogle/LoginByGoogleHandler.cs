using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(GoogleTokenValidatorDomainService googleTokenReader, IMapper mapper, ThirdPartyAuthenticatorDomainService thirdPartyAuthenticator, UserManager<Account> userManager, AccountCreatorByThirdPartyDomainService accountCreator, IHttpContextAccessor httpContextAccessor) : IRequestHandler<LoginByGoogleDto, AccountDto>
    {
        private readonly GoogleTokenValidatorDomainService _googleTokenReader = googleTokenReader;
        private readonly ThirdPartyAuthenticatorDomainService _thirdPartyAuthenticator = thirdPartyAuthenticator;
        private readonly AccountCreatorByThirdPartyDomainService _accountCreator = accountCreator;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

        public async Task<AccountDto> Handle(LoginByGoogleDto request, CancellationToken cancellationToken)
        {
            var googleUser = await _googleTokenReader.ValidateAsync(request.AccessToken, cancellationToken);
            var account = await _userManager.FindByLoginAsync(LoginProvider.Google, googleUser.UserId);

            if (account != null)
                await _thirdPartyAuthenticator.LoginAsync(account, cancellationToken);
            else
            {
                account = new Account(googleUser.Email, true, _httpContextAccessor.HttpContext.GetLanguage());
                await _accountCreator.CreateAsync(account, LoginProvider.Google, googleUser.UserId, cancellationToken);
            }

            return _mapper.Map<AccountDto>(account);
        }
    }
}
