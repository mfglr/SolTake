using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByFaceBook
{
    public class LoginByFaceBookHandler(ThirdPartyAuthenticatorDomainService faceBookAuthenticatorDomainService, IMapper mapper, FaceBookTokenValidatorDomainService faceBookTokenReader, UserManager<Account> userManager, AccountCreatorByThirdPartyDomainService accountCreatorDominService, IHttpContextAccessor httpContextAccessor) : IRequestHandler<LoginByFaceBookDto, AccountDto>
    {
        private readonly ThirdPartyAuthenticatorDomainService _faceBookAuthenticatorDomainService = faceBookAuthenticatorDomainService;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMapper _mapper = mapper;
        private readonly FaceBookTokenValidatorDomainService _faceBookTokenReader = faceBookTokenReader;
        private readonly AccountCreatorByThirdPartyDomainService _accountCreatorDominService = accountCreatorDominService;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

        public async Task<AccountDto> Handle(LoginByFaceBookDto request, CancellationToken cancellationToken)
        {
            var userId = await _faceBookTokenReader.ValidateAsync(request.AccessToken, cancellationToken);

            var account = await _userManager.FindByLoginAsync(LoginProvider.FaceBook, userId);

            if (account != null)
                await _faceBookAuthenticatorDomainService.LoginAsync(account, cancellationToken);
            else
            {
                account = new Account(null, true, _httpContextAccessor.HttpContext.GetLanguage());
                await _accountCreatorDominService.CreateAsync(account, LoginProvider.FaceBook, userId, cancellationToken);
            }

            return _mapper.Map<AccountDto>(account);
        }
    }
}
