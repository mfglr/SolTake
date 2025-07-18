﻿using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.StoryUserViewAggregate.Absracts;

namespace SolTake.Infrastructure.StoryDomain.StoryUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryUserViewAggregateInfrastructureServices(this IServiceCollection services)
            => services.AddScoped<IStoryUserViewRepository,StoryUserViewRepository>();
    }
}
