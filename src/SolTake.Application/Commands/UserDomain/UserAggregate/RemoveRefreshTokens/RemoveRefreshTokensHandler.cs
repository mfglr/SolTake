using MediatR;
using SolTake.Application.InfrastructureServices;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.RemoveRefreshTokens
{
    public class RemoveRefreshTokensHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork) : IRequestHandler<RemoveRefreshTokensDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveRefreshTokensDto request, CancellationToken cancellationToken)
        {
            _userAccessor.User.RemoveRefreshTokens(request.Token);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
