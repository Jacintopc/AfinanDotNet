using System;
using System.Collections.Generic;
using System.Web;

using System.Web.Security;

namespace AfinanDotNet2._0.Admin
{
    public class Afinan_MembershipUser: MembershipUser
    {
        private string _Empresa;
        private string _Vendedor;
        private string _Movil;
        private string _Fax;

        public string Empresa
        {
            get { return _Empresa; }
            set { _Empresa = value; }
        }

        public string Vendedor
        {
            get { return _Vendedor; }
            set { _Vendedor = value; }
        }

        public string Movil
        {
            get { return _Movil; }
            set { _Movil = value; }
        }

        public string Fax
        {
            get { return _Fax; }
            set { _Fax = value; }
        }

        /*

            This provider works with the following schema for the table of user data.

            CREATE TABLE Users
            (
              PKID Guid NOT NULL PRIMARY KEY,
              Username Text (255) NOT NULL,
              ApplicationName Text (255) NOT NULL,
              Email Text (128) NOT NULL,
              Comment Text (255),
              Password Text (128) NOT NULL,
              PasswordQuestion Text (255),
              PasswordAnswer Text (255),
              IsApproved YesNo, 
              LastActivityDate DateTime,
              LastLoginDate DateTime,
              LastPasswordChangedDate DateTime,
              CreationDate DateTime, 
              IsOnLine YesNo,
              IsLockedOut YesNo,
              LastLockedOutDate DateTime,
              FailedPasswordAttemptCount Integer,
              FailedPasswordAttemptWindowStart DateTime,
              FailedPasswordAnswerAttemptCount Integer,
              FailedPasswordAnswerAttemptWindowStart DateTime
 
              Empresa  Text 50
              vendedor Text 50
              movil    Text 50
              fax      Text 50 
  
            )

    */

        public Afinan_MembershipUser(string providername,
                                  string username,
                                  object providerUserKey,
                                  string email,
                                  string passwordQuestion,
                                  string comment,
                                  bool isApproved,
                                  bool isLockedOut,
                                  DateTime creationDate,
                                  DateTime lastLoginDate,
                                  DateTime lastActivityDate,
                                  DateTime lastPasswordChangedDate,
                                  DateTime lastLockedOutDate,
                                  string empresa,
                                  string vendedor,
                                  string movil,
                                  string fax) :
                                  base(providername,
                                       username,
                                       providerUserKey,
                                       email,
                                       passwordQuestion,
                                       comment,
                                       isApproved,
                                       isLockedOut,
                                       creationDate,
                                       lastLoginDate,
                                       lastActivityDate,
                                       lastPasswordChangedDate,
                                       lastLockedOutDate)
        {
            this.Empresa = empresa;
            this.Vendedor = vendedor;
            this.Movil = movil;
            this.Fax = fax;
        }


    }
}