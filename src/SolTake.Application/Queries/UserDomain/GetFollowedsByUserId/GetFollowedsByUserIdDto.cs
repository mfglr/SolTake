﻿using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.UserDomain.GetFollowedsByUserId
{
    public record GetFollowedsByUserIdDto(int UserId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<FollowResponseDto>>;
}
