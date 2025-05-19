using SolTake.Core;
using SolTake.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Application.Commands.AIModelAggregate.CreateAIModel
{
    public class CreateAIModelResponseDto(AIModel model)
    {
        public int Id { get; private set; } = model.Id;
        public string Name { get; private set; } = model.Name.Value;
        public int SolPerInputToken { get; private set; } = model.SolPerInputTokenWithCommission.Amount;
        public int SolPerOutputToken { get; private set; } = model.SolPerOutputTokenWithCommission.Amount;
        public Multimedia Image { get; private set; } = model.Image;
        public double Commission { get; private set; } = model.Commission;
    }
}
