using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestionByAdmin
{
    public record DeleteQuestionByAdminDto(int QuestionId) : IRequest;
}
