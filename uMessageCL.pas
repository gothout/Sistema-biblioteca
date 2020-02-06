unit uMessageCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessageCL = class(TForm)
    pnCorpo: TPanel;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessageCL: TfrmMessageCL;

implementation

{$R *.dfm}

uses uCadastrarLivros, uPrincipal;

procedure TfrmMessageCL.btnOkClick(Sender: TObject);
begin
  frmCadastrarLivros.spVoltarClick(self);
  Close;
  frmPrincipal.refreshClick(self);
end;

end.
