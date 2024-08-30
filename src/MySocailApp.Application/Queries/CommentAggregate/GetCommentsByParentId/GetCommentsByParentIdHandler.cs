using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId
{
    public class GetCommentsByParentIdHandler(ICommentQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentsByParentIdDto, List<CommentResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentQueryRepository _repository = repository;

        public Task<List<CommentResponseDto>> Handle(GetCommentsByParentIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetCommentsByParentIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.ParentId,
                    cancellationToken
                );
    }
}
