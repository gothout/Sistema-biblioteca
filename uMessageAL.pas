unit uMessageAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMessageCE, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessageAL = class(TfrmMessageCE)
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessageAL: TfrmMessageAL;

implementation

{$R *.dfm}

uses uAlteraLivro, uPrincipal;

procedure TfrmMessageAL.btnOkClick(Sender: TObject);
begin
  frmAlterarLivro.spVoltarClick(self);
  frmPrincipal.refreshClick(self);
  Close;
end;

end.
