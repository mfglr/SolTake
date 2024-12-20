using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionDto(int ExamId, int SubjectId, int? TopicId, string? Content, IFormFileCollection Medias) : IRequest<CreateQuestionResponseDto>;
}
