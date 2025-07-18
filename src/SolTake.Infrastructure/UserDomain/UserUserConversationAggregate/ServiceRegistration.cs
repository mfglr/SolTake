﻿using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;

namespace SolTake.Infrastructure.UserDomain.UserUserConversationAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserConversationAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IUserUserConversationWriteRepository, UserUserConversationWriteRepository>();
    }
}
