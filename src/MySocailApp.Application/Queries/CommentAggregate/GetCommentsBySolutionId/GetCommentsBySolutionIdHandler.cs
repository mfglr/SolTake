using AutoMapper;
using MediatR;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsBySolutionId
{
    public class GetCommentsBySolutionIdHandler(IMapper mapper, ICommentReadRepository repository) : IRequestHandler<GetCommentsBySolutionIdDto, List<CommentResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ICommentReadRepository _repository = repository;

        public async Task<List<CommentResponseDto>> Handle(GetCommentsBySolutionIdDto request, CancellationToken cancellationToken)
        {
            var comments = await _repository.GetBySolutoinIdAsync(request.SolutionId, request.LastValue, cancellationToken);
            return _mapper.Map<List<CommentResponseDto>>(comments);
        }
    }
}
