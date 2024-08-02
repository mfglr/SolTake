using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public class GetFollowersByIdHandler(IAppUserReadRepository repository, IMapper mapper) : IRequestHandler<GetFollowersByIdDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(GetFollowersByIdDto request, CancellationToken cancellationToken)
        {
            var users = await _repository.GetFollowersByIdAsync(request.Id, request.LastValue, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
