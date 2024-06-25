using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.Unfollow
{
    public class UnfollowHandler(IAccessTokenReader accessTokenReader, IAppUserRepository userRepository, IUnitOfWork unitOfWork) : IRequestHandler<UnfollowDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UnfollowDto request, CancellationToken cancellationToken)
        {
            var followerId = _accessTokenReader.GetRequiredAccountId();

            var followed =
                await _userRepository.GetWithFollowerByIdAsync(request.FollowedId,followerId,cancellationToken) ?? 
                throw new UserIsNotFoundException();

            followed.Unfollow(followerId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
