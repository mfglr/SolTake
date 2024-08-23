using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentLikes
{
    public class GetCommentLikesHandler(ICommentReadRepository commentReadRepository, IMapper mapper) : IRequestHandler<GetCommentLikesDto, List<AppUserResponseDto>>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<AppUserResponseDto>> Handle(GetCommentLikesDto request, CancellationToken cancellationToken)
        {
            var likes = await _commentReadRepository.GetCommentLikesAsync(request.CommentId, request, cancellationToken);
            return _mapper.Map<List<AppUserResponseDto>>(likes);
        }
    }
}
