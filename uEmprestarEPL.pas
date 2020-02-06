unit uEmprestarEPL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMessageCL, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMessageEPL = class(TfrmMessageCL)
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessageEPL: TfrmMessageEPL;

implementation

{$R *.dfm}

uses uEmprestar;

procedure TfrmMessageEPL.btnOkClick(Sender: TObject);
begin
  frmEmprestar.spVoltarClick(self);
  close;
end;

end.
