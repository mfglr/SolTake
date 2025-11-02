using Microsoft.AspNetCore.Http;

namespace SolTake.QuestionService.Application.UseCases.Create
{
    public record CreateQuestionDto(string? Content, Guid ExamId, Guid SubjectId, IEnumerable<string> Topics, IFormFileCollection Media);
}
