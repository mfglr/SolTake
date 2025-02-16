using MediatR;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetQuestionById
{
    public record GetQuestionByIdDto(int Id) : IRequest<QuestionResponseDto>;
}
