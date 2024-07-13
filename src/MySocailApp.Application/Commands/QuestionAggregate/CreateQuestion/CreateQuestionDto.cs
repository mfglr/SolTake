using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionDto(string? Content,int ExamId,int SubjectId,IEnumerable<int> TopicIds,IFormFileCollection Images) : IRequest<CreateQuestionResponseDto>;
}
