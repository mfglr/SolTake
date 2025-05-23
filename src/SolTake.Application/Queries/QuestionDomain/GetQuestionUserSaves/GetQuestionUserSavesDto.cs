using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain.GetQuestionUserSaves
{
    public record GetQuestionUserSavesDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionUserSaveResponseDto>>;
}
