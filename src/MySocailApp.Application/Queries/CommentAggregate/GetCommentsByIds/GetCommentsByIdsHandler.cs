using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByIds
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
