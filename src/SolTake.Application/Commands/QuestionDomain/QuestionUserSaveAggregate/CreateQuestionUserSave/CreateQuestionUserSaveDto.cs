using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave
{
    public record CreateQuestionUserSaveDto(int QuestionId) : IRequest<CreateQuestionUserSaveResponseDto>;
}
