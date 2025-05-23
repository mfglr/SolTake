using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;
using SolTake.Domain.CommentAggregate.Exceptions;

namespace SolTake.Application.Queries.CommentAggregate.GetCommentById
{
    public class GetCommentByIdHandler(ICommentQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetCommentByIdDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ICommentQueryRepository _repository = repository;

        public async Task<CommentResponseDto> Handle(GetCommentByIdDto request, CancellationToken cancellationToken)
            => await _repository
                .GetByIdAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request.Id,
                    cancellationToken
                ) ??
                throw new CommentNotFoundException();
    }
}
