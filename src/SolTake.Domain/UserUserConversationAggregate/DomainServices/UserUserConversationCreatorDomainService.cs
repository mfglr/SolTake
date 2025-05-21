using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Domain.UserUserConversationAggregate.Entities;

namespace SolTake.Domain.UserUserConversationAggregate.DomainServices
{
    public class UserUserConversationCreatorDomainService(IUserUserConversationWriteRepository userUserConversationWriteRepository)
    {
        private readonly IUserUserConversationWriteRepository _userUserConversationWriteRepository = userUserConversationWriteRepository;

        public async Task CreateAsync(UserUserConversation userUserConversation,CancellationToken cancellationToken)
        {
            var prev = await _userUserConversationWriteRepository.GetAsync(userUserConversation.ConverserId, userUserConversation.ListenerId, cancellationToken);
            if(prev != null)
                _userUserConversationWriteRepository.Delete(prev);

            userUserConversation.Create();
        }
    }
}
