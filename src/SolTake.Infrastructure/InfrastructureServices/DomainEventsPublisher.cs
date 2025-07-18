﻿using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Infrastructure.DbContexts;
using SolTake.Core;

namespace SolTake.Infrastructure.InfrastructureServices
{
    internal class DomainEventsPublisher(IPublisher publisher, AppDbContext context) : IDomainEventsPublisher
    {
        private readonly IPublisher _publisher = publisher;
        private readonly AppDbContext _context = context;

        public async Task PublishDomainEvents(CancellationToken cancellationToken)
        {
            var containers = _context
                .ChangeTracker
                .Entries<IDomainEventsContainer>()
                .Where(x => x.Entity.Events.Any())
                .Select(x => x.Entity)
                .ToList();

            foreach (var continer in containers)
                foreach (var @event in continer.Events)
                    await _publisher.Publish(@event, cancellationToken);
        }
    }
}
