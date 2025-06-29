﻿using MediatR;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SolTake.Api.Filters;
using SolTake.Application.Commands.StoryDomain.StoryAggregate.CreateStory;
using SolTake.Application.Commands.StoryDomain.StoryAggregate.DeleteStory;
using SolTake.Application.Queries.StoryDomain;
using SolTake.Application.Queries.StoryDomain.GetActiveStoriesByUserId;
using SolTake.Application.Queries.StoryDomain.GetAllStories;
using SolTake.Application.Queries.StoryDomain.GetStories;

namespace SolTake.Api.Controllers.Api
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
        [HttpGet("{userId}")]
        public async Task<List<StoryResponseDto>> GetActiveStoriesByUserId(int userId,CancellationToken cancellationToken)
            => await _sender.Send(new GetActiveStoriesByUserIdDto(userId),cancellationToken);
    }
}
