using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserByUserName
{
    public class GetUserByUserNameHandler(IMapper mapper, IAppUserReadRepository repository) : IRequestHandler<GetUserByUserNameDto, AppUserResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IAppUserReadRepository _repository = repository;

        public async Task<AppUserResponseDto> Handle(GetUserByUserNameDto request, CancellationToken cancellationToken)
        {
            var user =
                await _repository.GetByUserNameAsync(request.UserName, cancellationToken) ??
                throw new UserNotFoundException();
            return _mapper.Map<AppUserResponseDto>(user);
        }
    }
}
