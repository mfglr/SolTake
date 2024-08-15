using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.Follow
{
    public class FollowHandler(IAppUserWriteRepository userRepository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<FollowDto>
    {
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(FollowDto request, CancellationToken cancellationToken)
        {
            var followerId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetWithFollowerByIdAsync(request.FollowedId, followerId, cancellationToken) ??
                throw new UserNotFoundException();
            user.Follow(followerId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
