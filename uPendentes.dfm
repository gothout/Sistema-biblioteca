object frmPendentes: TfrmPendentes
  Left = 265
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmPendentes'
  ClientHeight = 497
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object spEscolha: TSpeedButton
    Left = 0
    Top = 446
    Width = 541
    Height = 24
    Align = alBottom
    Caption = 'Abrir informa'#231#245'es'
    Enabled = False
    OnClick = spEscolhaClick
    ExplicitTop = 440
  end
  object spSair: TSpeedButton
    Left = 0
    Top = 470
    Width = 541
    Height = 27
    Align = alBottom
    Caption = 'Sair'
    OnClick = spSairClick
    ExplicitLeft = -486
    ExplicitTop = 254
    ExplicitWidth = 904
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 65
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 535
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 134
      Height = 13
      Caption = 'Digite o c'#243'digo da entidade:'
    end
    object spPesquisar: TSpeedButton
      Left = 285
      Top = 29
      Width = 116
      Height = 21
      Caption = 'Pesquisar entidade'
      Enabled = False
      OnClick = spPesquisarClick
    end
    object spCancelar: TSpeedButton
      Left = 407
      Top = 29
      Width = 114
      Height = 21
      Caption = 'Cancelar'
      Enabled = False
      OnClick = spCancelarClick
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 29
      Width = 263
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      TextHint = 'Digite o c'#243'digo'
      OnChange = edtCodigoChange
    end
    object refresh: TButton
      Left = -64
      Top = -16
      Width = 75
      Height = 25
      Caption = 'REFRESH'
      TabOrder = 1
      Visible = False
      OnClick = refreshClick
    end
  end
  object dbListaLivros: TDBGrid
    Left = 0
    Top = 65
    Width = 541
    Height = 381
    Align = alClient
    DataSource = dtLista
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbListaLivrosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PENDENTE_COD_ALUNO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo da entidade'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PENDENTE_DIA'
        Title.Alignment = taCenter
        Title.Caption = 'Data que foi emprestado'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PENDENTE_HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Horario que foi emprestado'
        Width = 138
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'PENDENTE_LIVRO'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo do livro emprestado'
        Width = 138
        Visible = True
      end>
  end
  object dtLista: TDataSource
    DataSet = DM.cdsPENDENTES
    Left = 408
    Top = 184
  end
end
