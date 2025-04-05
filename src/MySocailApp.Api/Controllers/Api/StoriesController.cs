using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MySocailApp.Api.Filters;
using MySocailApp.Application.Commands.StoryDomain.StoryAggregate.CreateStory;
using MySocailApp.Application.Commands.StoryDomain.StoryAggregate.DeleteStory;
using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Application.Queries.StoryDomain.GetAllStories;
using MySocailApp.Application.Queries.StoryDomain.GetStories;

namespace MySocailApp.Api.Controllers.Api
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    [Authorize(Roles = "user", AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ServiceFilter(typeof(VersionFiltterAttribute))]
    [ServiceFilter(typeof(UserFilterAttribute))]
    [ServiceFilter(typeof(PrivacyPolicyApprovalFilterAttribute))]
    [ServiceFilter(typeof(TermsOfUseApprovalFilterAttribute))]
    [ServiceFilter(typeof(EmailVerificationFilterAttribute))]
    public class StoriesController(ISender sender) : ControllerBase
    {
        private readonly ISender _sender = sender;

        [HttpPost]
        public async Task<List<CreateStoryResponseDto>> Create([FromForm]IFormFileCollection medias, CancellationToken cancellationToken)
            => await _sender.Send(new CreateStoryDto(medias), cancellationToken);
        [HttpDelete("{storyId}")]
        public async Task Delete(int storyId, CancellationToken cancellationToken)
            => await _sender.Send(new DeleteStoryDto(storyId), cancellationToken);

        [HttpGet]
        public async Task<List<StoryResponseDto>> GetStories(CancellationToken cancellationToken)
            => await _sender.Send(new GetStoriesDto(),cancellationToken);
        [HttpGet]
        public async Task<List<StoryResponseDto>> GetAllStories([FromQuery] int? offset, [FromQuery] int take, [FromQuery] bool isDescending, CancellationToken cancellationToken)
            => await _sender.Send(new GetAllStoriesDto(offset,take,isDescending),cancellationToken);
    }
}
