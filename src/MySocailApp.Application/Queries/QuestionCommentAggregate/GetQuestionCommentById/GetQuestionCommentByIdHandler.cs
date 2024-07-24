using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionCommentAggregate.GetQuestionCommentById
{
    public class GetQuestionCommentByIdHandler(IQuestionCommentReadRepository repository, IMapper mapper) : IRequestHandler<GetQuestionCommentByIdDto, QuestionCommentResponseDto>
    {
        private readonly IQuestionCommentReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<QuestionCommentResponseDto> Handle(GetQuestionCommentByIdDto request, CancellationToken cancellationToken)
        {
            var comment = await _repository.GetByIdAsync(request.Id,cancellationToken);
            return _mapper.Map<QuestionCommentResponseDto>(comment);
        }
    }
}
