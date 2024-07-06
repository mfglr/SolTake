using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public class GetFollowedByIdHandler(IMapper mapper, IAppUserReadRepository repository) : IRequestHandler<GetFollowedsByIdDto, List<AppUserResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IAppUserReadRepository _repository = repository;

        public async Task<List<AppUserResponseDto>> Handle(GetFollowedsByIdDto request, CancellationToken cancellationToken)
        {
            var users = await _repository.GetFollowedsByIdAsync(request.Id, cancellationToken, request.LastId ?? "");
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
