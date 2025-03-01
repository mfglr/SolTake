using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.AddUserSearcher
{
    public class AddUserSearcherHandler(IUserWriteRepository userWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IMapper mapper) : IRequestHandler<AddUserSearcherDto, AddUserSearcherCommandResponseDto>
    {
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;

        public async Task<AddUserSearcherCommandResponseDto> Handle(AddUserSearcherDto request, CancellationToken cancellationToken)
        {
            var searcherId = _accessTokenReader.GetRequiredAccountId();
            var user =
                await _userWriteRepository.GetWithSearcherByIdAsync(request.SearchedId, searcherId, cancellationToken) ??
                throw new UserNotFoundException();

            var search = user.AddSearcher(searcherId);
            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<AddUserSearcherCommandResponseDto>(search);
        }
    }
}
