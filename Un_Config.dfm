object FConfig: TFConfig
  Left = 612
  Top = 233
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 351
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 268
    Height = 47
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      268
      47)
    object SpeedButton1: TSpeedButton
      Left = 175
      Top = 8
      Width = 81
      Height = 33
      Anchors = [akTop, akRight]
      Caption = '&Sair'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 6
    Width = 246
    Height = 288
    Caption = 'Configura'#231#245'es'
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 156
      Width = 207
      Height = 18
      Caption = 'Dura'#231#227'o do toque (segundos)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 16
      Top = 224
      Width = 209
      Height = 49
      Caption = 'Salvar Configura'#231#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object BT_Serial_Config: TButton
      Left = 16
      Top = 40
      Width = 209
      Height = 49
      Caption = 'Porta Serial'
      TabOrder = 0
      OnClick = BT_Serial_ConfigClick
    end
    object SPE_Duracao: TComboBox
      Left = 16
      Top = 184
      Width = 209
      Height = 30
      ItemHeight = 22
      TabOrder = 1
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '12'
        '15'
        '20')
    end
    object Button1: TButton
      Left = 16
      Top = 96
      Width = 209
      Height = 49
      Caption = 'Hor'#225'rios'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Dialog_busca_arquivo_som: TOpenDialog
    Filter = 'Arquivos de '#225'udio|*.mp3;*.wav|Todos os arquivos|*.*'
    Left = 552
    Top = 192
  end
  object ComPort: TComPort
    BaudRate = br9600
    Port = 'COM10'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 32
    Top = 25
  end
end
