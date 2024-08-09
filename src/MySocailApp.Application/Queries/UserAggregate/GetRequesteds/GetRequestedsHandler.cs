using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesteds
{
    public class GetRequestedsHandler(IAppUserReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetRequestedsDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetRequestedsDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var users = await _repository.GetRequestedsByIdAsync(accountId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
