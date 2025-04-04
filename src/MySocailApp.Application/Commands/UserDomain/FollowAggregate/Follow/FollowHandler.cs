﻿using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.FollowAggregate.DomainServices;

namespace MySocailApp.Application.Commands.UserDomain.FollowAggregate.Follow
{
    public class FollowHandler(IUnitOfWork unitOfWork, IFollowWriteRepository followWriteRepository, IAccessTokenReader accessTokenReader, UserFollowerDomainService userFollowerDomainService) : IRequestHandler<FollowDto, FollowCommandResponseDto>
    {
        private readonly IFollowWriteRepository _followWriteRepository = followWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly UserFollowerDomainService _userFollowerDomainService = userFollowerDomainService;

        public async Task<FollowCommandResponseDto> Handle(FollowDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();
            var follow = new Domain.UserDomain.FollowAggregate.Entities.Follow(login.UserId, request.FollowedId);
            await _userFollowerDomainService.Follow(follow, login, cancellationToken);
            await _followWriteRepository.CreateAsync(follow, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new(follow.Id);
        }
    }
}
