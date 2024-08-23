using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds
{
    public class GetNoFollowedsHandler(IAppUserReadRepository userReadRepository, IMapper mapper) : IRequestHandler<GetNotFollowedsDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _userReadRepository = userReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(GetNotFollowedsDto request, CancellationToken cancellationToken)
        {
            var users = await _userReadRepository.GetNotFollowedsByIdAsync(request.Id, request, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
