object FSobre: TFSobre
  Left = 650
  Top = 271
  BorderStyle = bsDialog
  Caption = 'Sobre...'
  ClientHeight = 352
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 57
    Align = alTop
    Caption = 'Sistema de Campainha Automatizada'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 465
    Height = 240
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 24
      Top = 16
      Width = 401
      Height = 193
      Caption = 'Sobre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 178
        Height = 16
        Caption = 'Desenvolvido por MULTIMEIOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 247
        Height = 16
        Caption = 'Software: Robson Borges - (Delphi Pascal)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 80
        Width = 239
        Height = 16
        Caption = 'Hardware: AJ Borges - Circuito Eletr'#244'nico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 104
        Width = 325
        Height = 16
        Caption = 'Vers'#227'o Original: 2013.2 (acionamento por porta paralela)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 128
        Width = 291
        Height = 16
        Caption = 'Atualiza'#231#227'o: 2017.2 (acionamento por porta serial)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 152
        Width = 336
        Height = 16
        Caption = 'Sistema Registrador no INPI sob N'#186' BR 51 2016 001628-0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 297
    Width = 465
    Height = 55
    Align = alBottom
    Color = clGray
    TabOrder = 2
    object Button1: TButton
      Left = 160
      Top = 16
      Width = 145
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
