using MediatR;
using Microsoft.AspNetCore.Http;

namespace QuestionWriteService.Application.CreateQuestion
{
    public record CreateQuestionDto(string Exam, string Subject, IEnumerable<string> Topics, string Content, IFormFileCollection Files) : IRequest<Guid>
    {
    }
}
