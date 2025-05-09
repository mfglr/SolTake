﻿using MediatR;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionDomain.GetSolutionUpvotes
{
    public class GetSolutionUpvotesHandler(ISolutionUserVoteQueryRepository repository) : IRequestHandler<GetSolutionUpvotesDto, List<SolutionUserVoteResponseDto>>
    {
        private readonly ISolutionUserVoteQueryRepository _repository = repository;

        public Task<List<SolutionUserVoteResponseDto>> Handle(GetSolutionUpvotesDto request, CancellationToken cancellationToken)
            => _repository
                .GetSolutionUpvotes(
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
