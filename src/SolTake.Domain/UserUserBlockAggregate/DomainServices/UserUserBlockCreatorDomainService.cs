﻿using SolTake.Domain.UserAggregate.Exceptions;
using SolTake.Domain.UserUserBlockAggregate.Exceptions;
using SolTake.Domain.UserUserBlockAggregate.Abstracts;
using SolTake.Domain.UserUserBlockAggregate.Entities;
using SolTake.Domain.UserAggregate.Abstracts;

namespace SolTake.Domain.UserUserBlockAggregate.DomainServices
{
    public class UserUserBlockCreatorDomainService(IUserReadRepository userReadRepository, IUserUserBlockRepository userUserBlockRepository)
    {
        private readonly IUserReadRepository _userReadRepository = userReadRepository;
        private readonly IUserUserBlockRepository _userUserBlockRepository = userUserBlockRepository;

        public async Task CreateAsync(UserUserBlock userUserBlock, CancellationToken cancellationToken)
        {
            var blocked =
                await _userReadRepository.GetByIdAsync(userUserBlock.BlockedId, cancellationToken) ??
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(userUserBlock.BlockedId, userUserBlock.BlockerId, cancellationToken))
                throw new UserNotFoundException();

            if (await _userUserBlockRepository.ExistAsync(userUserBlock.BlockerId, userUserBlock.BlockedId, cancellationToken))
                throw new UserUserBlockAlreadyCreatedException();

            userUserBlock.Create();
        }
    }
}
