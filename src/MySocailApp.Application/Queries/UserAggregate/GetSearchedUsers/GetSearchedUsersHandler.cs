using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers
{
    public class GetSearchedUsersHandler(IAppUserReadRepository userReadRepository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSearchedUsersDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _userReadRepository = userReadRepository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetSearchedUsersDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var users = await _userReadRepository.GetSearchedUsersByIdAsync(userId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
