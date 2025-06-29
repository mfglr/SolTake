﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.StoryAggregate.Exceptions
{
    public class PermissionDeniedToDeleteStoryException : AppException
    {
        private readonly static string _messageEn = "You can't delete a story that doesn't belong to you!";
        private readonly static string _messageTr = "Sana ait olmayan hikayeyi silimezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToDeleteStoryException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
