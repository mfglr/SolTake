using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.Unfollow
{
    public class UnfollowHandler(IUserWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<UnfollowDto>
    {
        private readonly IUserWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(UnfollowDto request, CancellationToken cancellationToken)
        {
            var accountId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _repository.GetWithFollowerByIdAsync(request.FollowedId, accountId, cancellationToken) ??
                throw new UserNotFoundException();
            user.Unfollow(accountId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
