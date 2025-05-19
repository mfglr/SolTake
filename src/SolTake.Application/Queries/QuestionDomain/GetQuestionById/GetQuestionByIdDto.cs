using MediatR;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionById
{
    public record GetQuestionByIdDto(int Id) : IRequest<QuestionResponseDto>;
}
