using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace AfinanDotNet2._0.Admin
{
    public partial class ListaNauticas : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewNauticas.BottomPagerRow.Visible = true;
        }

        protected void View_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "Ultimo":
                    if (GridViewNauticas.PageIndex != (GridViewNauticas.PageCount - 1)) 
                        GridViewNauticas.PageIndex = GridViewNauticas.PageCount - 1; 
                    break; 
                case "Primero":
                    if (GridViewNauticas.PageIndex != 0) 
                        GridViewNauticas.PageIndex = 0; 
                    break;
                case "Nueva":
                    NuevaNautica(); 
                    break; 
                case "Siguiente" :
                    if(GridViewNauticas.PageIndex < GridViewNauticas.PageCount - 1) 
                        GridViewNauticas.PageIndex++; 
                    break; 
                case "Anterior":
                    if(GridViewNauticas.PageIndex > 0) GridViewNauticas.PageIndex--; 
                    break; 
            }

        }
        protected void GridViewNauticas_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool EstaActivo = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsApproved"));
                if (!EstaActivo)
                {
                    e.Row.ForeColor = System.Drawing.Color.Gray;
                    e.Row.BackColor = System.Drawing.Color.LightGray;
                }
            }
        }

        protected void GridViewNauticas_SelectedIndexChanged(object sender, EventArgs e)
        {

            // Get the currently selected row using the SelectedRow property.
            GridViewRow myrow = GridViewNauticas.SelectedRow;


            // Display the company name from the selected row.
            // In this example, the third column (index 2) contains
            // the company name.
            Response.Redirect("~/Admin/EditaNautica.aspx?IDNautica=" + ((LinkButton)myrow.Cells[0].Controls[0]).Text);   

        }


        protected void NuevaNautica()
        {

            Response.Redirect("~/Admin/EditaNautica.aspx?IDNautica=0"); //?IDNautica=0

        }


    }
}