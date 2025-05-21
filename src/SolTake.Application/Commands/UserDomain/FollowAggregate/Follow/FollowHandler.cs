using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserUserFollowAggregate.Abstracts;
using SolTake.Domain.UserUserFollowAggregate.DomainServices;
using SolTake.Domain.UserUserFollowAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Follow
{
    public class FollowHandler(IUnitOfWork unitOfWork, IUserUserFollowWriteRepository followWriteRepository, IAccessTokenReader accessTokenReader, UserUserFollowCreatorDomainService userFollowerDomainService) : IRequestHandler<FollowDto, FollowCommandResponseDto>
    {
        private readonly IUserUserFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserUserFollowCreatorDomainService _userFollowerDomainService = userFollowerDomainService;

        public async Task<FollowCommandResponseDto> Handle(FollowDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var follow = new UserUserFollow(login.UserId, request.FollowedId);
            await _userFollowerDomainService.Follow(follow, login, cancellationToken);
            await _followWriteRepository.CreateAsync(follow, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(follow.Id);
        }
    }
}
