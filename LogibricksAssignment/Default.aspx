<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LogibricksAssignment._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-3">
            <div class="card">
                <div class="card-header bg-primary text-uppercase text-white">
                    <h5>Import Excel File</h5>
                </div>
                <div class="card-body">
                    <button style="margin-bottom:10px;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        <i class="fa fa-plus-circle"></i> Import Excel
                    </button>
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Import Excel File</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Choose excel file</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />
                                                        <label class="custom-file-label"></label>
                                                    </div>
                                                    <label id="filename"></label>
                                                    <div class="input-group-append">
                                                        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-outline-primary" Text="Upload" OnClick="Button1_Click" />
                                                    </div>
                                                </div>
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="GridView1" HeaderStyle-CssClass="bg-primary text-white" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false"  onrowediting="GridView1_RowEditing" CssClass="table table-bordered``">  
                        <EmptyDataTemplate>  
                            <div class="text-center">No record found</div>  
                        </EmptyDataTemplate>  
                        <Columns>  
                            <asp:BoundField HeaderText="Sr No" DataField="SrNo" />  
                            <asp:BoundField HeaderText="Company Name" DataField="CompanyName" />  
                            <asp:BoundField HeaderText="Turnover Amt" DataField="TurnoverAmt" /> 
                            <asp:BoundField HeaderText="GSTIN" DataField="GSTIN" />  
                            <asp:BoundField HeaderText="Start date" DataField="Sdate" />  
                            <asp:BoundField HeaderText="End date" DataField="Edate" /> 
                            <asp:BoundField HeaderText="Email" DataField="Email" /> 
                            <asp:BoundField HeaderText="Contact No" DataField="Contact" /> 
                        </Columns>  
                    </asp:GridView> 
                </div>
            </div>
        </div>
    </form>
</body>
</html>

