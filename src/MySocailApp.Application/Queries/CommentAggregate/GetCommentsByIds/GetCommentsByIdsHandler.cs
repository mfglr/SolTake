using AutoMapper;
using MediatR;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByIds
{
    public class GetCommentsByIdsHandler(ICommentReadRepository commentReadRepository, IMapper mapper) : IRequestHandler<GetCommentsByIdsDto, List<CommentResponseDto>>
    {
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<CommentResponseDto>> Handle(GetCommentsByIdsDto request, CancellationToken cancellationToken)
        {
            var comments = await _commentReadRepository.GetByIds(request.Ids, cancellationToken);
            return _mapper.Map<List<CommentResponseDto>>(comments);
        }
    }
}
