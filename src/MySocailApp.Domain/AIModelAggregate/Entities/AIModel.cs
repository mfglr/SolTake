using MySocailApp.Core;
using MySocailApp.Domain.AIModelAggregate.ValueObjects;

namespace MySocailApp.Domain.AIModelAggregate.Entities
{
    public class AIModel : Entity, IAggregateRoot
    {
        public AIModelName Name { get; private set; }
        public Sol SolPerInputToken { get; private set; }
        public Sol SolPerOutputToken { get; private set; }
        public Multimedia Image { get; private set; }

        public AIModel(AIModelName name, Sol solPerInputToken, Sol solPerOutputToken, Multimedia image)
        {
            Name = name;
            SolPerInputToken = solPerInputToken;
            SolPerOutputToken = solPerOutputToken;
            Image = image;
        }

        private AIModel() { }
    }
}
