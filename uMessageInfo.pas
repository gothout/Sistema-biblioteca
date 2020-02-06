unit uMessageInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessageInfo = class(TForm)
    pnCorpo: TPanel;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessageInfo: TfrmMessageInfo;

implementation

{$R *.dfm}

uses uInfo, uPendentes;

procedure TfrmMessageInfo.btnOkClick(Sender: TObject);
begin
  frmInfo.spVoltarClick(self);
  Close;
  frmPendentes.spEscolha.Enabled := False;
  frmPendentes.spCancelarClick(self);
end;

end.
