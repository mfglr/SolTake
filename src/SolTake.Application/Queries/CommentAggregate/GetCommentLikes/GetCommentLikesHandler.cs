using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentLikes
{
    public class GetCommentLikesHandler(ICommentUserLikeQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentLikesDto, List<CommentUserLikeResponseDto>>
    {
        private readonly ICommentUserLikeQueryRepository _repository = repository;

        public Task<List<CommentUserLikeResponseDto>> Handle(GetCommentLikesDto request, CancellationToken cancellationToken)
            => _repository
                .GetLikesAsync(
                    request.CommentId,
                    request,
                    cancellationToken
               );
    }
}
