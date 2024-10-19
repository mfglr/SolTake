using MySocailApp.Core;

namespace MySocailApp.Infrastructure.Extetions
{
    public static class QueryableExtentions
    {
        public static IQueryable<T> ToPage<T>(this IQueryable<T> query, IPage page) where T : IHasId
        {
            if (page.IsDescending)
                return query
                    .Where(x => x.Id < page.Offset)
                    .OrderByDescending(x => x.Id)
                    .Take(page.Take);
            return query
                .Where(x => x.Id > page.Offset)
                .OrderBy(x => x.Id)
                .Take(page.Take);
        }
    }
}
