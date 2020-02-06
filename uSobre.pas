unit uSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmSobre.btnOkClick(Sender: TObject);
begin
  frmPrincipal.Visible := True;
  Close;
end;

end.
