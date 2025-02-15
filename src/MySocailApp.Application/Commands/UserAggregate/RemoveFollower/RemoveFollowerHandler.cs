using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.RemoveFollower
{
    public class RemoveFollowerHandler(IAccessTokenReader accessTokenReader, IUserWriteRepository userRepository, IUnitOfWork unitOfWork) : IRequestHandler<RemoveFollowerDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUserWriteRepository _userRepository = userRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(RemoveFollowerDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var user = 
                await _userRepository.GetWithFollowerByIdAsync(userId,request.FollowerId,cancellationToken) ??
                throw new UserNotFoundException();
            user.RemoveFollower(request.FollowerId);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
