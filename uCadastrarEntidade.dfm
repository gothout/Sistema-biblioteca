inherited frmCadastrarEntidade: TfrmCadastrarEntidade
  Left = 574
  Top = 279
  BorderStyle = bsNone
  Caption = 'Cadastrar entidades'
  ClientHeight = 499
  ClientWidth = 402
  ExplicitWidth = 402
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCabecalho: TPanel
    Width = 402
    ExplicitWidth = 402
    inherited spVoltar: TSpeedButton
      OnClick = spVoltarClick
    end
  end
  inherited pnCorpo: TPanel
    Width = 402
    Height = 417
    ExplicitWidth = 402
    ExplicitHeight = 417
    object Label3: TLabel
      Left = 26
      Top = 122
      Width = 69
      Height = 13
      Caption = 'Digite o nome:'
    end
    object Label2: TLabel
      Left = 26
      Top = 170
      Width = 67
      Height = 13
      Caption = 'Digite o email:'
    end
    object Label4: TLabel
      Left = 26
      Top = 218
      Width = 83
      Height = 13
      Caption = 'Digite o telefone:'
    end
    object Label5: TLabel
      Left = 26
      Top = 266
      Width = 93
      Height = 13
      Caption = 'Digite o WhatsApp:'
    end
    object Label7: TLabel
      Left = 26
      Top = 312
      Width = 157
      Height = 13
      Caption = 'Digite a sua data de nascimento:'
    end
    object SpeedButton1: TSpeedButton
      Left = 26
      Top = 358
      Width = 335
      Height = 43
      Caption = 'Cadastrar'
      OnClick = SpeedButton1Click
    end
    object Label9: TLabel
      Left = 18
      Top = 49
      Width = 367
      Height = 34
      Caption = 'Cadastramento de entidades'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Franklin Gothic Medium'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 26
      Top = 141
      Width = 335
      Height = 21
      TabOrder = 0
      TextHint = 'Digite o nome da entidade'
    end
    object edtTelefone: TMaskEdit
      Left = 28
      Top = 237
      Width = 197
      Height = 21
      EditMask = '!\(99\)000-00000;1;_'
      MaxLength = 13
      TabOrder = 1
      Text = '(  )   -     '
      TextHint = 'Digite o telefone da entidade'
    end
    object edtWpp: TMaskEdit
      Left = 26
      Top = 285
      Width = 197
      Height = 21
      EditMask = '!\(99\)000-00000;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '(  )   -     '
      TextHint = 'Digite o Whatsapp da entidade'
    end
    object dtNasc: TDateTimePicker
      Left = 26
      Top = 331
      Width = 335
      Height = 21
      Date = 43748.784444918980000000
      Time = 43748.784444918980000000
      TabOrder = 3
    end
    object btnTenhoT: TButton
      Left = 297
      Top = 233
      Width = 64
      Height = 25
      Caption = 'Tenho'
      Enabled = False
      TabOrder = 4
      OnClick = btnTenhoTClick
    end
    object btnNaoT: TButton
      Left = 231
      Top = 233
      Width = 60
      Height = 25
      Caption = 'Nao tenho'
      TabOrder = 5
      OnClick = btnNaoTClick
    end
    object btnNaoW: TButton
      Left = 231
      Top = 283
      Width = 60
      Height = 25
      Caption = 'Nao tenho'
      TabOrder = 6
      OnClick = btnNaoWClick
    end
    object btnTenhoW: TButton
      Left = 297
      Top = 283
      Width = 64
      Height = 25
      Caption = 'Tenho'
      Enabled = False
      TabOrder = 7
      OnClick = btnTenhoWClick
    end
    object edtEmail: TEdit
      Left = 26
      Top = 191
      Width = 335
      Height = 21
      TabOrder = 8
      TextHint = 'Digite o email da etidade'
    end
  end
  inherited pnFim: TPanel
    Top = 458
    Width = 402
    ExplicitTop = 458
    ExplicitWidth = 402
    inherited Label1: TLabel
      Left = 408
      Top = -12
      Align = alCustom
      ExplicitLeft = 408
      ExplicitTop = -12
    end
  end
  object param1: TPanel
    Left = 396
    Top = 0
    Width = 6
    Height = 41
    TabOrder = 3
    Visible = False
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 224
    Top = 48
  end
end
