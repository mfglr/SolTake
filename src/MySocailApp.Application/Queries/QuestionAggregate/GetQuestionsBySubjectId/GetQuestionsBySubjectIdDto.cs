using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsBySubjectId
{
    public record GetQuestionsBySubjectIdDto(int SubjectId,int? LastValue) : IRequest<List<QuestionResponseDto>>;
}
