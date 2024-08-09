using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public class SearchUserHandler(IAppUserReadRepository repository, IMapper mapper) : IRequestHandler<SearchUserDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(SearchUserDto request, CancellationToken cancellationToken)
        {
            var users = await _repository.SearchUser(request.Key, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
