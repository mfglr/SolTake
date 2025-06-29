﻿using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.UserUserBlockAggregate.DomainServices;

namespace MySocailApp.Domain.UserUserBlockAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddUserUserBlockAggregateServices(this IServiceCollection services)
            => services
                .AddScoped<UserUserBlockCreatorDomainService>();
    }
}
