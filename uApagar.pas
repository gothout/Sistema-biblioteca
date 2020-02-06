unit uApagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMessageCL, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmApagar = class(TfrmMessageCL)
    btnNao: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    parametro1 : String;
  end;

var
  frmApagar: TfrmApagar;

implementation

{$R *.dfm}

uses uDM, uPrincipal;

procedure TfrmApagar.btnNaoClick(Sender: TObject);
begin
  close;
end;

procedure TfrmApagar.btnOkClick(Sender: TObject);
begin
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('DELETE FROM CADASTRARLIVROS');
  dm.qryPrincipal.SQL.Add(' WHERE LIVRO_CODIGO = ' + QuotedStr(parametro1));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  frmPrincipal.refreshClick(self);
  close;
end;

end.

