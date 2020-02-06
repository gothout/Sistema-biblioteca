object PADRONIZAÇÃO: TPADRONIZAÇÃO
  Left = 0
  Top = 0
  Caption = 'PADRONIZA'#199#195'O'
  ClientHeight = 594
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 26
    Top = 296
    Width = 69
    Height = 13
    Caption = 'Digite o nome:'
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 953
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object spVoltar: TSpeedButton
      Left = 8
      Top = 3
      Width = 49
      Height = 35
      Caption = '<----'
    end
  end
  object pnCorpo: TPanel
    Left = 0
    Top = 41
    Width = 953
    Height = 512
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
  end
  object pnFim: TPanel
    Left = 0
    Top = 553
    Width = 953
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 753
      Top = 14
      Width = 187
      Height = 13
      Caption = 'Desenvolvido por Lucas Daniel Chaves'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
end
