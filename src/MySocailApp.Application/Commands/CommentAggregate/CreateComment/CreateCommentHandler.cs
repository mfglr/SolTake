using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository, ICommentQueryRepository commentQueryRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator, IAccountReadRepository accountReadRepository, UserNamesReaderDomainService userNameReader) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly UserNamesReaderDomainService _userNameReader = userNameReader;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;
        private readonly IAccountReadRepository _accountReadRepository = accountReadRepository;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(request.Content);
            var idsOfUsersTagged = await _accountReadRepository.GetAccountIdsByUserNames(userNames, cancellationToken);
            var userId = _accessTokenReader.GetRequiredAccountId();
            var content = new CommentContent(request.Content);
            var comment = new Comment(userId, content, idsOfUsersTagged);
            await _commentCreator.CreateAsync(comment, request.QuestionId, request.SolutionId, request.RepliedId, cancellationToken);
            
            await _commentWriteRepository.CreateAsync(comment, cancellationToken);
            
            await _unitOfWork.CommitAsync(cancellationToken);

            return (await _commentQueryRepository.GetByIdAsync(userId, comment.Id, cancellationToken))!;
        }
    }
}
