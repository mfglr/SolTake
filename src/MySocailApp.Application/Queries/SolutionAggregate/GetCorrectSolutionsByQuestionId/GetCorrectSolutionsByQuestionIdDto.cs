using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetCorrectSolutionsByQuestionId
{
    public class GetCorrectSolutionsByQuestionIdDto(int questionId, int offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<SolutionResponseDto>>
    {
        public int QuestionId { get; set; } = questionId;
    }
}
