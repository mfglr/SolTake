using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public class GetCommentLikesHandler(ICommentUserLikeQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentLikesDto, List<CommentUserLikeResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentUserLikeQueryRepository _repository = repository;

        public Task<List<CommentUserLikeResponseDto>> Handle(GetCommentLikesDto request, CancellationToken cancellationToken)
            => _repository
                .GetLikesAsync(
                    request.CommentId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
               );
    }
}
