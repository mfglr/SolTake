using MediatR;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionById
{
    public record GetQuestionByIdDto(int Id) : IRequest<QuestionResponseDto>;
}
