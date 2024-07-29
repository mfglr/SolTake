using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetUser
{
    public class GetUserHandler(IMapper mapper, IAccessTokenReader accessTokenReader, IAppUserReadRepository repository) : IRequestHandler<GetUserDto, AppUserResponseDto>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<AppUserResponseDto> Handle(GetUserDto request, CancellationToken cancellationToken)
        {
            var id = _accessTokenReader.GetRequiredAccountId();
            var user = await _repository.GetByIdAsync(id, cancellationToken);
            return _mapper.Map<AppUserResponseDto>(user);
        }
    }
}
