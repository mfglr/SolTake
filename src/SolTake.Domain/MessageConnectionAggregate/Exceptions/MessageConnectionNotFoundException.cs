﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageConnectionAggregate.Exceptions
{
    public class MessageConnectionNotFoundException : AppException
    {
        private readonly static string _messageEn = "Connection not found exception!";
        private readonly static string _messageTr = "Bağlantı bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageConnectionNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}
