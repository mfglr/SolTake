using MySocailApp.Core;
using MySocailApp.Domain.AIModelAggregate.DomainEvents;
using MySocailApp.Domain.AIModelAggregate.Exceptions;
using MySocailApp.Domain.AIModelAggregate.ValueObjects;

namespace MySocailApp.Domain.AIModelAggregate.Entities
{
    public class AIModel : Entity, IAggregateRoot
    {
        public AIModelName Name { get; private set; }
        public Sol SolPerInputToken { get; private set; }
        public Sol SolPerOutputToken { get; private set; }
        public Multimedia Image { get; private set; }
        public double Commission { get; private set; }

        private AIModel() { }

        public AIModel(AIModelName name, Sol solPerInputToken, Sol solPerOutputToken, Multimedia image, double commission)
        {
            if (image.MultimediaType != MultimediaType.Image)
                throw new InvalidAIModelMediaTypeException();
            Name = name;
            SolPerInputToken = solPerInputToken;
            SolPerOutputToken = solPerOutputToken;
            Image = image;
            Commission = commission;
        }

        public void Create() => CreatedAt = DateTime.UtcNow;

        public void UpdateImage(Multimedia image)
        {
            if (image.MultimediaType != MultimediaType.Image)
                throw new InvalidAIModelMediaTypeException();

            AddDomainEvent(new AIModelImageDeletedDomainEvent(Image));

            Image = image;
            UpdatedAt = DateTime.UtcNow;
        }

        public void UpdateCommision(double commission)
        {
            Commission = commission;
            UpdatedAt = DateTime.UtcNow;
        }
    }
}
