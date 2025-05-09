﻿using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.TermsOfUseAggregate.Abstracts;

namespace MySocailApp.Infrastructure.UserDomain.TermsOfUseAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddTermsOfUseAggregate(this IServiceCollection services)
            => services
                .AddScoped<ITermsOfUseReadRepository, TermsOfUseReadRepository>()
                .AddScoped<ITermsOfUseWriteRepository, TermsOfUseWriteRepository>();
    }
}
