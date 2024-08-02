using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesters
{
    public class GetRequesterHandler(IAppUserReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetRequesterDto, List<AppUserResponseDto>>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<AppUserResponseDto>> Handle(GetRequesterDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var users = await _repository.GetRequestersByIdAsync(accountId, request.LastValue, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(users);
        }
    }
}
