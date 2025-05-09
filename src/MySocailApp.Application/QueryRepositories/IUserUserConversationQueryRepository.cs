﻿using MySocailApp.Application.Queries.UserUserConversation;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IUserUserConversationQueryRepository
    {
        Task<List<UserUserConversationResponseDto>> GetAsync(int userId, IPage page, CancellationToken cancellationToken);
    }
}
