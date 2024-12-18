using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionDto(int ExamId, int SubjectId, int? TopicId, string? Content, IFormFileCollection Medias) : IRequest<QuestionResponseDto>;
}
