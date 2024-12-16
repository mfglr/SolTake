using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public class FollowHandler(IUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<FollowDto, FollowCommandResponseDto>
    {
        private readonly IUserWriteRepository _userRepository = userRepository;
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
