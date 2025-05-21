using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.DeleteQuestionUserSave
{
    public record DeleteQuestionUserSaveDto(int QuestionId) : IRequest;
}
