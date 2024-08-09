using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public class GetFollowedByIdHandler(IMapper mapper, IAppUserReadRepository repository) : IRequestHandler<GetFollowedsByIdDto, List<AppUserResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IAppUserReadRepository _repository = repository;

        public async Task<List<AppUserResponseDto>> Handle(GetFollowedsByIdDto request, CancellationToken cancellationToken)
        {
            var users = await _repository.GetFollowedsByIdAsync(request.Id, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
