using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserById
{
    public class GetByIdHandler(IAppUserQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetUserByIdDto, AppUserResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserQueryRepository _repository = repository;

        public async Task<AppUserResponseDto> Handle(GetUserByIdDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByIdAsync(
                    request.Id,
                    _accessTokenReader.GetRequiredAccountId(),
                    cancellationToken
                ) ??
                throw new UserNotFoundException();
    }
}
