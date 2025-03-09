using MediatR;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Abstracts;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment
{
    public class CreateCommentLikeHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ICommentUserLikeWriteRepository commentUserLikeWriteRepository) : IRequestHandler<CreateCommentUserLikeDto, CreateCommentUserLikeResponseDto>
    {
        private readonly ICommentUserLikeWriteRepository _commentUserLikeWriteRepository = commentUserLikeWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateCommentUserLikeResponseDto> Handle(CreateCommentUserLikeDto request, CancellationToken cancellationToken)
        {
            

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
