using MediatR;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsBySubjectId
{
    public record GetQuestionsBySubjectIdDto(int SubjectId,int? LastId) : IRequest<List<QuestionResponseDto>>;
}
