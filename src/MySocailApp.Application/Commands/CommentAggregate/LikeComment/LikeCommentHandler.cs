using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Domain.CommentAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.Exceptions;

namespace MySocailApp.Application.Commands.CommentAggregate.LikeComment
{
    public class LikeCommentHandler(ICommentWriteRepository repository, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<LikeCommentDto, CommentUserLikeResponseDto>
    {
        private readonly ICommentWriteRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<CommentUserLikeResponseDto> Handle(LikeCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var comment =
                await _repository.GetWithLikeByIdAsync(request.Id, userId, cancellationToken) ??
                throw new CommentNotFoundException();
            var like = comment.Like(userId);
            await _unitOfWork.CommitAsync(cancellationToken);

            return _mapper.Map<CommentUserLikeResponseDto>(like);
        }
    }
}
