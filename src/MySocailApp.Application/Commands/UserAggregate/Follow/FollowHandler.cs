using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public class FollowHandler(IAppUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<FollowDto, FollowCommandResponseDto>
    {
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<FollowCommandResponseDto> Handle(FollowDto request, CancellationToken cancellationToken)
        {
            var followerId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetWithFollowerByIdAsync(request.FollowedId, followerId, cancellationToken) ??
                throw new UserNotFoundException();
            var follow = user.Follow(followerId);
            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<FollowCommandResponseDto>(follow);
        }
    }
}
