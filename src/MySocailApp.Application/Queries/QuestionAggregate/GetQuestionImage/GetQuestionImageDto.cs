using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public record GetQuestionImageDto(int QuestionId,int QuestionImageId) : IRequest<Stream>;
}
