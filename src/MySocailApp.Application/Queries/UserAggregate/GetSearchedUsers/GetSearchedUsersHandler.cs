using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers
{
    public class GetSearchedUsersHandler(IAppUserQueryRepository userQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSearchedUsersDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserQueryRepository _userQueryRepository = userQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetSearchedUsersDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            return await _userQueryRepository.GetSearchedUsersAsync(userId, userId, request, cancellationToken);
        }
    }
}
