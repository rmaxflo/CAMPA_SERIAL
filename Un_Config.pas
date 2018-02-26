unit Un_Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, jpeg, Spin, CPort, Shellapi;

type
  TFConfig = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Dialog_busca_arquivo_som: TOpenDialog;
    BT_Serial_Config: TButton;
    ComPort: TComPort;
    SPE_Duracao: TComboBox;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BT_Serial_ConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation

uses Un_principal;

{$R *.dfm}

procedure TFConfig.SpeedButton1Click(Sender: TObject);
begin
      Close;
      

end;

procedure TFConfig.SpeedButton2Click(Sender: TObject);
Var
    BITS: string;
begin
       //Gravando Configurações no registro do Windows.
        Bits:='0';

        Config_Bits:=Bits;
        Config_Duracao:= SPE_Duracao.Text;
        Config_Porta:=ComPort.Port;
        Config_arquivomp3:= 'toque_musical.mp3';

        //Repassado Dados para o registro.
        with FPrincipal Do
          begin
             registro.WriteString('Porta',Config_Porta);
             registro.WriteString('bits',Config_Bits);
             registro.WriteString('Duracao',Config_Duracao);
             registro.WriteString('arquivo_mp3',Config_arquivomp3);
          End;
end;

procedure TFConfig.FormShow(Sender: TObject);
begin

        //Config_Bits.Text:=Config_Bits;
        SPE_Duracao.Text:=(Config_Duracao);
        //ED_Arquivo.Text:=Config_arquivomp3;

end;



procedure TFConfig.SpeedButton3Click(Sender: TObject);
begin
      Dialog_busca_arquivo_som.Execute;
end;

procedure TFConfig.BT_Serial_ConfigClick(Sender: TObject);
begin
      ComPort.ShowSetupDialog;
end;

procedure TFConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      FPrincipal.BT_Incializacao.Click;
end;

procedure TFConfig.Button1Click(Sender: TObject);
begin
      ShellExecute(Handle,'open',pchar('horarios.ini'),nil,nil,sw_show);
end;

end.
