using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.DeleteQuestionUserSave
{
    public record DeleteQuestionUserSaveDto(int QuestionId) : IRequest;
}
