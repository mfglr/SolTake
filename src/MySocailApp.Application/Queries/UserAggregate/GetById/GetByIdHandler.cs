using AutoMapper;
using MediatR;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Queries.UserAggregate.GetById
{
    public class GetByIdHandler(IAppUserRepository userRepository, IMapper mapper) : IRequestHandler<GetByIdDto, UserResponseDto>
    {
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<UserResponseDto> Handle(GetByIdDto request, CancellationToken cancellationToken)
        {
            var user = 
                await _userRepository.GetByIdWithFollowersAndFolloweds(request.Id,cancellationToken) ??
                throw new UserIsNotFoundException();

            return _mapper.Map<AppUser,UserResponseDto>(
                user,
                x => x.AfterMap((user,response) =>
                {
                    response.numberOfFollowers = user.Followers.Count();
                    response.numberOfFolloweds = user.Followeds.Count();
                }) 
            );
            
        }
    }
}
