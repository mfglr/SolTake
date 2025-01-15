using AccountDomain.Abstracts;
using AccountDomain.ValueObjects;
using MediatR;
using MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist;

namespace MySocailApp.Application.Queries.UserAggregate.IsUserNameExist
{
    public class IsUserNameExistHandler(IAccountReadRepository accountReadRepository) : IRequestHandler<IsUserNameExistDto, bool>
    {
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task<bool> Handle(IsUserNameExistDto request, CancellationToken cancellationToken)
        {
            var userName = new UserName(request.UserName);
            return await _accountReadRepository.UserNameExist(userName, cancellationToken);
        }
    }
}
