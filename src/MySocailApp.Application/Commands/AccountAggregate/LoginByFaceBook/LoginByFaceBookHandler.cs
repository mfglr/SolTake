using AutoMapper;
using MediatR;
using MySocailApp.Domain.AccountAggregate.DomainServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByFaceBook
{
    public class LoginByFaceBookHandler(AccountManager accountManager, IMapper mapper, IFaceBookTokenReader faceBookTokenValidator) : IRequestHandler<LoginByFaceBookDto, AccountDto>
    {
        private readonly AccountManager _accountManager = accountManager;
        private readonly IMapper _mapper = mapper;
        private readonly IFaceBookTokenReader _faceBookTokenValidator = faceBookTokenValidator;

        public async Task<AccountDto> Handle(LoginByFaceBookDto request, CancellationToken cancellationToken)
        {
            var userId = await _faceBookTokenValidator.ReadUserId(request.AccessToken,cancellationToken);
            var account = await _accountManager.LoginByFacebookAsync(userId, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
