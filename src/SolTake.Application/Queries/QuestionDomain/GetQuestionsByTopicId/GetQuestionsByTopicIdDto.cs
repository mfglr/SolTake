using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionsByTopicId
{
    public record GetQuestionsByTopicIdDto(int TopicId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionResponseDto>>;
}
