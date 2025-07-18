﻿using MediatR;

namespace SolTake.Application.Commands.MessageDomain.MessageUserViewAggregate.MarkMessagesAsViewed
{
    public record MarkMessagesAsViewedDto(List<int> MessageIds) : IRequest;
}
