using Microsoft.AspNetCore.Http;

namespace SolTake.QuestionService.Application.UseCases.Create
{
    public record CreateQuestionDto(string? Content, string ExamName, string SubjectName, IEnumerable<string> Topics, IFormFileCollection Media);
}
