using SolTake.Application.Queries.QuestionUserComplaintAggregate;
using SolTake.Domain.QuestionUserComplaintAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class QuestionUserComplaintQueryableMapper
    {
        public static IQueryable<QuestionUserComplaintResponseDto> ToQuestionUserComplaintResponseDto(this IQueryable<QuestionUserComplaint> query, AppDbContext context)
            => query
                .Join(
                    context.Questions,
                    quc => quc.QuestionId,
                    q => q.Id,
                    (quc, q) =>
                        new QuestionUserComplaintResponseDto(
                            quc.Id,
                            quc.CreatedAt,
                            quc.Reason,
                            quc.Content.Value,
                            q.Medias,
                            q.Content.Value
                        )
                );
    }
}
