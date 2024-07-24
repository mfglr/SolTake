using MediatR;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.DislikeQuestionComment
{
    public record DislikeQuestionCommentDto(int Id) : IRequest;
}
