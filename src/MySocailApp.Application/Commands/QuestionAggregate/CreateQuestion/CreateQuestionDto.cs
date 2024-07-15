using MediatR;
using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Queries.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public record CreateQuestionDto : IRequest<QuestionResponseDto>
    {
        public CreateQuestionDto(string content,int examId,int subjectId,string topicIds, IFormFileCollection images)
        {
            Content = content;
            ExamId = examId;
            SubjectId = subjectId;
            TopicIds = topicIds.Split(",").Select(x => int.Parse(x)).ToList();
            Images = images;
        }

        public string? Content {  get; private set; }
        public int ExamId { get; private set; }
        public int SubjectId { get; private set; }
        public IEnumerable<int> TopicIds { get; private set; }
        public IFormFileCollection Images { get; private set; }
    }
}
