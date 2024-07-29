using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest
{
    public class AcceptFollowRequestHandler(IUnitOfWork unitOfWork, IAppUserWriteRepository userRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<AcceptFollowRequestDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAppUserWriteRepository _userRepository = userRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task Handle(AcceptFollowRequestDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user = await _userRepository.GetWithRequesterByIdAsync(userId, request.RequesterId, cancellationToken);
            user!.AcceptFollowRequest(request.RequesterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
