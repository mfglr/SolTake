using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public class GetCommentsBySolutionIdHandler(ICommentQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentsBySolutionIdDto, List<CommentResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentQueryRepository _repository = repository;

        public Task<List<CommentResponseDto>> Handle(GetCommentsBySolutionIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetCommentsBySolutionIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.SolutionId,
                    cancellationToken
                );
    }
}
