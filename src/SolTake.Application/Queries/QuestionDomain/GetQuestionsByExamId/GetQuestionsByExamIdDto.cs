using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionsByExamId
{
    public record GetQuestionsByExamIdDto(int ExamId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
