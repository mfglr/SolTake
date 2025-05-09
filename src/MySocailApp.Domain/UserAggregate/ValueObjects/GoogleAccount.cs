﻿using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.UserAggregate.Exceptions;

namespace MySocailApp.Domain.UserAggregate.ValueObjects
{
    public class GoogleAccount
    {
        public string GoogleId { get; private set; }
        public string Email { get; private set; }//not mapped

        private GoogleAccount() { }

        public GoogleAccount(string googleId, string email)
        {
            GoogleId = googleId ?? throw new ServerSideException();
            Email = email ?? throw new EmailIsRequiredException();
        }
    }
}
