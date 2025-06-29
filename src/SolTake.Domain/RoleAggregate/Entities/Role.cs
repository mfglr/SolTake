﻿using SolTake.Core;

namespace SolTake.Domain.RoleAggregate.Entities
{
    public class Role : IHasId, IAggregateRoot
    {
        public int Id { get; private set; }
        public string Name { get; private set; }

        public Role(string name) => Name = name;
    }
}
