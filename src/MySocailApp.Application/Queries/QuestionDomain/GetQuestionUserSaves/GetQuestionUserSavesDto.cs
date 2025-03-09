using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionUserSaves
{
    public class GetQuestionUserSavesDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<QuestionUserSaveResponseDto>>;
}
