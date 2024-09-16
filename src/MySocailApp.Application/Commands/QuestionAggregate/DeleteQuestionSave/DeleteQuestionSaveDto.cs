using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.DeleteQuestionSave
{
    public record DeleteQuestionSaveDto(int QuestionId) : IRequest;
}
