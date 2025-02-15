using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserByUserName
{
    public class GetUserByUserNameHandler(IAppUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserByUserNameDto, UserResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _repository = repository;

        public async Task<UserResponseDto> Handle(GetUserByUserNameDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByUserNameAsync(
                    request.UserName,
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                ) ??
                throw new UserNotFoundException();
    }
}
