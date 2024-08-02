using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByTopicId
{
    public record GetQuestionsByTopicIdDto(int TopicId, int? LastValue) : IRequest<List<QuestionResponseDto>>;
}
