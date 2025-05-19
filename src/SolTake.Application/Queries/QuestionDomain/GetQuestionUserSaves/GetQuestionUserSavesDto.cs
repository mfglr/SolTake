using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionUserSaves
{
    public record GetQuestionUserSavesDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<QuestionUserSaveResponseDto>>;
}
