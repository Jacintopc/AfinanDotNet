using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AfinanDotNet2._0
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Version BuildVersion = Page.GetType().BaseType.Assembly.GetName().Version;
                versionnumber.Text = BuildVersion.ToString();
            }
        }
    }
}