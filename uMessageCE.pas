unit uMessageCE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessageCE = class(TForm)
    pnCorpo: TPanel;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessageCE: TfrmMessageCE;

implementation

{$R *.dfm}

uses uCadastrarEntidade;

procedure TfrmMessageCE.btnOkClick(Sender: TObject);
begin
  frmCadastrarEntidade.spVoltarClick(self);
  Close;
end;

end.
