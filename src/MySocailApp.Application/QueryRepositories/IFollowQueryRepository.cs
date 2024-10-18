﻿using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IFollowQueryRepository
    {
        Task<FollowResponseDto?> GetFollowerAsync(int accountId, int followId, CancellationToken cancellationToken);
        Task<List<FollowResponseDto>> GetFollowersAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<FollowResponseDto>> GetFollowedsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken);
    }
}
