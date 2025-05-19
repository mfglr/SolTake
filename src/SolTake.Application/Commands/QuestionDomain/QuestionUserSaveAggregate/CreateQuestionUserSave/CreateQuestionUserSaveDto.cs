using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave
{
    public record CreateQuestionUserSaveDto(int QuestionId) : IRequest<CreateQuestionUserSaveResponseDto>;
}
