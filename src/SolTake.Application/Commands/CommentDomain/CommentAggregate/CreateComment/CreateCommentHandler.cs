using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.CommentAggregate;
using SolTake.Domain.CommentAggregate.Abstracts;
using SolTake.Domain.CommentAggregate.DomainServices;
using SolTake.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using SolTake.Domain.UserAggregate.Abstracts;

namespace SolTake.Application.Commands.CommentDomain.CommentAggregate.CreateComment
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository,IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator, IUserReadRepository userReadRepository, UserNamesReaderDomainService userNameReader) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly UserNamesReaderDomainService _userNameReader = userNameReader;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly IUserReadRepository _userReadRepository = userReadRepository;

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userNames = _userNameReader.GetUserNames(request.Content);

            var idsOfUsersTagged = await _userReadRepository.GetUserIdsByUserNames(userNames, cancellationToken);
            var login = _accessTokenReader.GetLogin();
            var content = new CommentContent(request.Content);
            var comment = new Comment(login.UserId, content, idsOfUsersTagged);
            await _commentCreator.CreateAsync(comment, request.QuestionId, request.SolutionId, request.RepliedId, login, cancellationToken);

            await _commentWriteRepository.CreateAsync(comment, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return CommentResponseDto.Create(comment,login);
        }
    }
}
