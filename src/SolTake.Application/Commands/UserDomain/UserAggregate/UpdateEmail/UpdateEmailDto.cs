﻿using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateEmail
{
    public record UpdateEmailDto(string Email) : IRequest;
}
