using SolTake.Core;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionResponseDto(int Id, IEnumerable<Multimedia> Medias);
}
