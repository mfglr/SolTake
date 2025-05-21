using MySocailApp.Application.Queries.UserDomain.SearchUsers;
using SolTake.Domain.UserAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SearchUserQueryableMapper
    {
        public static IQueryable<SearchUserResponseDto> ToSearchUserResponse(this IQueryable<User> query)
            => 
                query
                    .Select(
                        user => new SearchUserResponseDto(
                            user.Id,
                            user.UserName.Value,
                            user.Name,
                            user.Image
                        )
                    );
    }
}
