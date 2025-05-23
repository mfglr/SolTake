using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentsByQuestionId
{
    public class GetCommentsByQuestionIdHandler(ICommentQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentsByQuestionIdDto, List<CommentResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentQueryRepository _repository = repository;

        public Task<List<CommentResponseDto>> Handle(GetCommentsByQuestionIdDto request, CancellationToken cancellationToken)
            => _repository
                .GetCommentsByQuestionIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
