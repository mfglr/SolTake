using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest
{
    public class MakeFollowRequestHandler(IAppUserWriteRepository userRepository,IAccessTokenReader accessTokenReader,IUnitOfWork unitOfWork) : IRequestHandler<MakeFollowRequestDto>
    {
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MakeFollowRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userRepository.GetWithFollowerRequesterBlockedBlockerByIdAsync(request.RequestedId,userId,cancellationToken) ??
                throw new UserIsNotFoundException();
            user.MakeFollowRequest(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
