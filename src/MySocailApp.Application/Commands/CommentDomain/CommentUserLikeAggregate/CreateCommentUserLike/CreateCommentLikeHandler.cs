using MediatR;
using MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.CreateCommentUserLike;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Abstracts;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Entities;
using MySocailApp.Domain.CommentDomain.CommentUserLikeAggregate.Exceptions;

namespace MySocailApp.Application.Commands.CommentDomain.CommentUserLikeAggregate.LikeComment
{
    public class CreateCommentLikeHandler(IUnitOfWork unitOfWork, IUserAccessor userAccessor, ICommentUserLikeWriteRepository commentUserLikeWriteRepository, ICommentUserLikeReadRepository commentUserLikeReadRepository) : IRequestHandler<CreateCommentUserLikeDto, CreateCommentUserLikeResponseDto>
    {
        private readonly ICommentUserLikeWriteRepository _commentUserLikeWriteRepository = commentUserLikeWriteRepository;
        private readonly ICommentUserLikeReadRepository _commentUserLikeReadRepository = commentUserLikeReadRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateCommentUserLikeResponseDto> Handle(CreateCommentUserLikeDto request, CancellationToken cancellationToken)
        {
            if (await _commentUserLikeReadRepository.ExistAsync(request.CommentId, _userAccessor.User.Id, cancellationToken))
                throw new CommentAlreadyLikedException();
            var like = CommentUserLike.Create(request.CommentId, _userAccessor.User.Id);
            await _commentUserLikeWriteRepository.CreateAsync(like, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(like.Id);
        }
    }
}
