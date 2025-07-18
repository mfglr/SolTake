﻿using Microsoft.AspNetCore.Mvc.Filters;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.Exceptions;

namespace SolTake.Api.Filters
{
    public class EmailVerificationFilterAttribute(IUserAccessor userAccessor) : ActionFilterAttribute
    {
        private readonly IUserAccessor _userAccessor = userAccessor;

        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!_userAccessor.User.IsEmailVerified)
                throw new EmailIsNotConfirmedException();
            await next();
        }
    }
}
