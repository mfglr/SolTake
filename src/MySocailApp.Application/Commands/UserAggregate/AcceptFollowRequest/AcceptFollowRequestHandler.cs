using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest
{
    public class AcceptFollowRequestHandler(IUnitOfWork unitOfWork, IAppUserRepository userRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<AcceptFollowRequestDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAppUserRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(AcceptFollowRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user = 
                await _userRepository.GetWithRequesterByIdAsync(userId, request.RequesterId, cancellationToken) ?? 
                throw new UserIsNotFoundException();
            user.AcceptFollowRequest(request.RequesterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
