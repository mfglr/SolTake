using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserById
{
    public class GetByIdHandler(IAppUserReadRepository repository, IMapper mapper) : IRequestHandler<GetUserByIdDto, AppUserResponseDto>
    {
        private readonly IAppUserReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<AppUserResponseDto> Handle(GetUserByIdDto request, CancellationToken cancellationToken)
        {
            var user = 
                await _repository.GetByIdAsync(request.Id, cancellationToken) ??
                throw new UserIsNotFoundException();
            return _mapper.Map<AppUserResponseDto>(user);
        }
    }
}
