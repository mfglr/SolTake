using MediatR;

namespace MySocailApp.Application.Commands.QuestionCommentAggregate.LikeQuestionComment
{
    public record LikeQuestionCommentDto(int Id) : IRequest;
}
