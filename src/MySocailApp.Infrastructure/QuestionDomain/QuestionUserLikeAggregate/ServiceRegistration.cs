﻿using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IQuestionUserLikeReadRepository, QuestionUserLikeReadRepository>()
                .AddScoped<IQuestionUserLikeWriteRepository, QuestionUserLikeWriteRepository>();

    }
}
