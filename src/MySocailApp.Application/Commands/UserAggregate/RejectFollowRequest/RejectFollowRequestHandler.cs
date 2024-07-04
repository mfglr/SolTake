using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Application.Commands.UserAggregate.RejectFollowRequest
{
    public class RejectFollowRequestHandler(IAccessTokenReader accessTokenReader, IAppUserRepository repository, IUnitOfWork unitOfWork) : IRequestHandler<RejectFollowRequestDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IAppUserRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RejectFollowRequestDto request, CancellationToken cancellationToken)
        {
            var accoutId = _accessTokenReader.GetRequiredAccountId();
            var user = await _repository.GetWithRequesterByIdAsync(accoutId, request.RequesterId, cancellationToken);
            user.RejectFollowRequest(request.RequesterId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
