﻿using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.ExamAggregate.Abstracts;

namespace SolTake.Infrastructure.ExamAggregate
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddExamInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IExamReadRepository, ExamReadRepository>()
                .AddScoped<IExamWriteRepository, ExamWriteRepository>();
    }
}
