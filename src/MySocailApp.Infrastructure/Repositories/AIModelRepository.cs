using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AIModelAggregate.Abstracts;
using MySocailApp.Domain.AIModelAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.Repositories
{
    public class AIModelRepository(AppDbContext context) : IAIModelRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(AIModel aiModel, CancellationToken cancellationToken)
            => await _context.AIModels.AddAsync(aiModel,cancellationToken);

        public void Delete(AIModel aiModel)
            => _context.AIModels.Remove(aiModel);

        public List<AIModel> GetAll()
            => _context.AIModels.ToList();

        public Task<AIModel?> GetAsync(int id, CancellationToken cancellationToken)
            => _context.AIModels.FirstOrDefaultAsync(x => x.Id == id,cancellationToken);
    }
}
