using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest
{
    public class MakeFollowRequestHandler(IAppUserRepository userRepository,IAccessTokenReader accessTokenReader,IUnitOfWork unitOfWork) : IRequestHandler<MakeFollowRequestDto>
    {
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeFollowRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetWithFollowerAndRequesterByIdAsync(request.RequestedId,userId,cancellationToken) ??
                throw new UserIsNotFoundException();
            user.MakeFollowRequest(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
