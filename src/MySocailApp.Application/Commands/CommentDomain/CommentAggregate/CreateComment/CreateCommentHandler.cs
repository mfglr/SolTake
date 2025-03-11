using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentDomain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;

namespace MySocailApp.Application.Commands.CommentDomain.CommentAggregate.CreateComment
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository, ICommentQueryRepository commentQueryRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator, IUserReadRepository userReadRepository, UserNamesReaderDomainService userNameReader) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly UserNamesReaderDomainService _userNameReader = userNameReader;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly ICommentQueryRepository _commentQueryRepository = commentQueryRepository;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(request.Content);
            var idsOfUsersTagged = await _userReadRepository.GetUserIdsByUserNames(userNames, cancellationToken);
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
