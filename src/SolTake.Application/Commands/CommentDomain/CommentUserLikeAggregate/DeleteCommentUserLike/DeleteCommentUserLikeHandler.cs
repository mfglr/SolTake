using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.CommentUserLikeAggregate.Exceptions;
using SolTake.Domain.CommentUserLikeAggregate.Abstracts;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.DeleteCommentUserLike
{
    public class DeleteCommentUserLikeHandler(IUnitOfWork unitOfWork, ICommentUserLikeWriteRepository commentUserLikeWriteRepository, IUserAccessor userAccessor) : IRequestHandler<DeleteCommentUserLikeDto>
    {
        private readonly ICommentUserLikeWriteRepository _commentUserLikeWriteRepository = commentUserLikeWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(DeleteCommentUserLikeDto request, CancellationToken cancellationToken)
        {
            var like = 
                await _commentUserLikeWriteRepository.GetAsync(request.CommentId, _userAccessor.User.Id, cancellationToken) ??
                throw new CommentLikeNotFoundException();
            _commentUserLikeWriteRepository.Delete(like);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
