using Microsoft.AspNetCore.Http;

namespace SolTake.QuestionService.Application.ApplicationServices.Create
{
    public record CreateQuestionDto(string? Content, int ExamId, int SubjectId, IEnumerable<string> Topics, IFormFileCollection Media);
}
