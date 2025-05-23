using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentsByIds
{
    public class GetCommentsByIdsHandler(ICommentQueryRepository commentQueryRepository,IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentsByIdsDto, List<CommentResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;

        public Task<List<CommentResponseDto>> Handle(GetCommentsByIdsDto request, CancellationToken cancellationToken)
            => _commentQueryRepository
                .GetByIdsAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request.Ids,
                    cancellationToken
                );
    }
}
