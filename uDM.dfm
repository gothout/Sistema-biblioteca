object DM: TDM
  Left = 0
  Top = 0
  Caption = 'DM'
  ClientHeight = 423
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnCONEXAO: TPanel
    Left = 0
    Top = 0
    Width = 105
    Height = 423
    Align = alLeft
    TabOrder = 0
  end
  object pnLISTADELIVROS: TPanel
    Left = 105
    Top = 0
    Width = 105
    Height = 423
    Align = alLeft
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 210
    Top = 0
    Width = 105
    Height = 423
    Align = alLeft
    TabOrder = 2
  end
  object SQLConexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Biblioteca\BANCO.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 32
    Top = 48
  end
  object qryPrincipal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 32
    Top = 104
  end
  object dsLIVRO: TSQLDataSet
    CommandText = 'select * from CADASTRARLIVROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 144
    Top = 32
  end
  object dspLIVRO: TDataSetProvider
    DataSet = dsLIVRO
    Left = 144
    Top = 80
  end
  object cdsLIVRO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLIVRO'
    Left = 144
    Top = 136
  end
  object dsPENDENTES: TSQLDataSet
    CommandText = 'select * from PENDENDENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 256
    Top = 32
  end
  object dspPENDENTES: TDataSetProvider
    DataSet = dsPENDENTES
    Left = 256
    Top = 80
  end
  object cdsPENDENTES: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPENDENTES'
    Left = 256
    Top = 136
  end
end
