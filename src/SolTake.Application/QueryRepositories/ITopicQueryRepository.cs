﻿using MySocailApp.Application.Queries.TopicAggregate;
using SolTake.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface ITopicQueryRepository
    {
        Task<List<TopicResponseDto>> GetSubjectTopicsAsync(int subjectId,IPage page,CancellationToken cancellationToken);
    }
}
