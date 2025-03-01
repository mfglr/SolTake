using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.FollowAggregate.Exceptions;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Follow
{
    public class FollowHandler(IUnitOfWork unitOfWork, IFollowReadRepository followReadRepository, IUserAccessor userAccessor, IFollowWriteRepository followWriteRepository, IUserReadRepository userReadRepository) : IRequestHandler<FollowDto, FollowCommandResponseDto>
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IFollowReadRepository _followReadRepository = followReadRepository;
        private readonly IFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;

        public async Task<FollowCommandResponseDto> Handle(FollowDto request, CancellationToken cancellationToken)
        {
            if (_userAccessor.User.Id == request.FollowedId)
                throw new PermissionDeniedToFollowYourselfException();

            if (!await _userReadRepository.Exist(request.FollowedId, cancellationToken))
                throw new UserNotFoundException();

            if (await _followReadRepository.ExistAsync(_userAccessor.User.Id, request.FollowedId, cancellationToken))
                throw new UserIsAlreadyFollowedException();

            var follow = Domain.UserDomain.FollowAggregate.Entities.Follow.Create(_userAccessor.User.Id, request.FollowedId);

            await _followWriteRepository.CreateAsync(follow, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new (follow.Id);
        }
    }
}
