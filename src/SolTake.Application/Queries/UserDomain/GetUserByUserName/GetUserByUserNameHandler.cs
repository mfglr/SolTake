using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Application.Queries.UserDomain.GetUserByUserName
{
    public class GetUserByUserNameHandler(IUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserByUserNameDto, UserResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserQueryRepository _repository = repository;

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
