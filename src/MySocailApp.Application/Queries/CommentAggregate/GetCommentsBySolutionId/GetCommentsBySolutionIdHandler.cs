using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
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
