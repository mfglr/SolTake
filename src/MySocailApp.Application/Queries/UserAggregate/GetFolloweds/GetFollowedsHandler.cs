using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Queries.UserAggregate.GetFolloweds
{
    public class GetFollowedsHandler(IAppUserReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowedsDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetFollowedsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var users = await _repository.GetFollowedsById(accountId, cancellationToken, request.LastId ?? "");
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
