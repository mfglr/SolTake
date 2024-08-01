using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.AppUserAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Application.Commands.UserAggregate.CancelFollowRequest
{
    public class CancelFollowRequestHandler(IAppUserWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<CancelFollowRequestDto>
    {
        private readonly IAppUserWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(CancelFollowRequestDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var user = 
                await _repository.GetWithFollowerRequesterByIdAsync(request.RequesterId, accountId, cancellationToken) ??
                throw new UserIsNotFoundException();
            user!.CancelFollowRequest(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
