using AutoMapper;
using MediatR;
using MySocailApp.Domain.CommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByQuestionId
{
    public class GetCommentsByQuestionIdHandler(IMapper mapper, ICommentReadRepository repository) : IRequestHandler<GetCommentsByQuestionIdDto, List<CommentResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ICommentReadRepository _repository = repository;

        public async Task<List<CommentResponseDto>> Handle(GetCommentsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var comments = await _repository.GetByQuestionIdAsync(request.QuestionId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<CommentResponseDto>>(comments);
        }
    }
}
