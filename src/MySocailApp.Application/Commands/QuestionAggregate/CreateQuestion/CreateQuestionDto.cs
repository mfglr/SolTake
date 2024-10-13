using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionDto(string? Content, int ExamId, int SubjectId, int TopicId, IFormFileCollection Images) : IRequest<QuestionResponseDto>{}
}
