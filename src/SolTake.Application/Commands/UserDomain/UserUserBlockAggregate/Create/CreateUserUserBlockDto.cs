﻿using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserUserBlockAggregate.Create
{
    public record CreateUserUserBlockDto(int BlockedId) : IRequest<CreateUserUserBlockResponseDto>;
}
