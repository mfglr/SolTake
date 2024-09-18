using AutoMapper;
using MediatR;
using MySocailApp.Domain.AccountAggregate.DomainServices;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByGoogle
{
    public class LoginByGoogleHandler(IGoogleTokenReader googleTokenReader, IMapper mapper, AccountManager accountManager) : IRequestHandler<LoginByGoogleDto, AccountDto>
    {
        private readonly IGoogleTokenReader _googleTokenReader = googleTokenReader;
        private readonly AccountManager _accountManager = accountManager;
        private readonly IMapper _mapper = mapper;

        public async Task<AccountDto> Handle(LoginByGoogleDto request, CancellationToken cancellationToken)
        {
            var googleUser = await _googleTokenReader.ReadToken(request.AccessToken, cancellationToken);
            var account = await _accountManager.LoginByGoogleAsync(googleUser, cancellationToken);
            return _mapper.Map<AccountDto>(account);
        }
    }
}
