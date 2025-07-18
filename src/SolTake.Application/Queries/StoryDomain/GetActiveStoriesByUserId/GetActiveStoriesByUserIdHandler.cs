﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.StoryDomain.GetActiveStoriesByUserId
{
    public class GetActiveStoriesByUserIdHandler(IStoryQueryRepository storyQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetActiveStoriesByUserIdDto, List<StoryResponseDto>>
    {
        private readonly IStoryQueryRepository _storyQueryRepository = storyQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<StoryResponseDto>> Handle(GetActiveStoriesByUserIdDto request, CancellationToken cancellationToken)
            => _storyQueryRepository.GetActiveStoriesByUserId(request.UserId, _accessTokenReader.GetAccountId(), cancellationToken);
    }
}
