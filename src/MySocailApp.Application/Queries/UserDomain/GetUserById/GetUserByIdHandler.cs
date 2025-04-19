using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserDomain.GetUserById
{
    public class GetByIdHandler(IUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserByIdDto, UserResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserQueryRepository _repository = repository;

        public async Task<UserResponseDto> Handle(GetUserByIdDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByIdAsync(
                    request.Id,
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                ) ??
                throw new UserNotFoundException();
    }
}
