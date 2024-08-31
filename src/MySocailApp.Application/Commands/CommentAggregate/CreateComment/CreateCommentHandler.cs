using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository, ICommentQueryRepository commentQueryRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new CommentContent(request.Content);
            var comment = new Comment();
            await _commentCreator.CreateAsync(comment, userId, content, request.QuestionId, request.SolutionId, request.RepliedId, cancellationToken);
            await _commentWriteRepository.CreateAsync(comment, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _commentQueryRepository.GetByIdAsync(userId, comment.Id, cancellationToken))!;
        }
    }
}
