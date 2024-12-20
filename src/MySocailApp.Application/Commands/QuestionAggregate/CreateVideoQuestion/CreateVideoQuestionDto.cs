using MediatR;
using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateVideoQuestion
{
    public record CreateVideoQuestionDto(int ExamId, int SubjectId, int? TopicId, string? Content, IFormFile Video) : IRequest<CreateVideoQuestionResponseDto>;
}
