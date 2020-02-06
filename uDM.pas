unit uDM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider, Vcl.ExtCtrls;

type
  TDM = class(TForm)
    pnCONEXAO: TPanel;
    SQLConexao: TSQLConnection;
    qryPrincipal: TSQLQuery;
    pnLISTADELIVROS: TPanel;
    dsLIVRO: TSQLDataSet;
    dspLIVRO: TDataSetProvider;
    cdsLIVRO: TClientDataSet;
    Panel1: TPanel;
    dsPENDENTES: TSQLDataSet;
    dspPENDENTES: TDataSetProvider;
    cdsPENDENTES: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
