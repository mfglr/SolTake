using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionsByTopicId
{
    public class GetQuestionsByTopicIdDto(int topicId, int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionResponseDto>>
    {
        public int TopicId { get; private set; } = topicId;
    }
}
