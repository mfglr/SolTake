﻿using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.StoryAggregate.Abstracts;

namespace MySocailApp.Infrastructure.StoryDomain.StoryAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IStoryRepository,StoryRepository>();
    }
}
