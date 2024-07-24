using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentsByQuestionId
{
    public class GetQuestionCommentsByQuestionIdHandler(IMapper mapper, IQuestionCommentReadRepository repository) : IRequestHandler<GetQuestionCommentsByQuestionIdDto, List<QuestionCommentResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IQuestionCommentReadRepository _repository = repository;

        public async Task<List<QuestionCommentResponseDto>> Handle(GetQuestionCommentsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var comments = await _repository.GetByQuestionIdAsync(request.QuestionId,request.LastId,cancellationToken);
            return _mapper.Map<List<QuestionCommentResponseDto>>(comments);
        }
    }
}
