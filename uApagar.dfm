inherited frmApagar: TfrmApagar
  Caption = 'frmApagar'
  ExplicitWidth = 455
  ExplicitHeight = 124
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCorpo: TPanel
    inherited btnOk: TButton
      Left = 136
      Caption = 'Sim'
      ExplicitLeft = 136
    end
    object btnNao: TButton
      Left = 240
      Top = 88
      Width = 75
      Height = 25
      Caption = 'N'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnNaoClick
    end
  end
end
