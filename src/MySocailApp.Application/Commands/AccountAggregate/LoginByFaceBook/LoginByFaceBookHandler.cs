using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByFaceBook
{
    public class LoginByFaceBookHandler(IMapper mapper, FaceBookTokenValidatorDomainService faceBookTokenReader, IHttpContextAccessor httpContextAccessor) : IRequestHandler<LoginByFaceBookDto, AccountDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly FaceBookTokenValidatorDomainService _faceBookTokenReader = faceBookTokenReader;
        private readonly IHttpContextAccessor _httpContextAccessor = httpContextAccessor;

        public async Task<AccountDto> Handle(LoginByFaceBookDto request, CancellationToken cancellationToken)
        {
            var userId = await _faceBookTokenReader.ValidateAsync(request.AccessToken, cancellationToken);


            //if (account != null)
            //    await _faceBookAuthenticatorDomainService.LoginAsync(account, cancellationToken);
            //else
            //{
            //    account = new Account(null, true, _httpContextAccessor.HttpContext.GetLanguage());
            //    await _accountCreatorDominService.CreateAsync(account, LoginProvider.FaceBook, userId, cancellationToken);
            //}

            return _mapper.Map<AccountDto>(null);
        }
    }
}
