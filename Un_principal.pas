unit Un_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, StdCtrls, Buttons, jpeg, Menus, Registry,
  ComCtrls, ExtDlgs, shellapi;

type
  TFPrincipal = class(TForm)
    PN_RELOGIO: TPanel;
    BT_TOCAR_CAMPA: TBitBtn;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    IM_Logo: TImage;
    LB_Horarios_Lista: TLabel;
    LB_HORARIOS: TListBox;
    PN_PROX_HORARIO: TPanel;
    PN_TEMPO_RESTO: TPanel;
    LB_proximo_horario: TLabel;
    LB_Tempo_restante: TLabel;
    BT_VERIFICA_PROX_HORARIO: TButton;
    BT_LIGAR_PARALELA: TButton;
    PopupMenu1: TPopupMenu;
    Configuraes1: TMenuItem;
    N1: TMenuItem;
    SairdoPrograma1: TMenuItem;
    StatusBar1: TStatusBar;
    PN_DATA: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    Sobre1: TMenuItem;
    Ajuda1: TMenuItem;
    SB_Sair: TSpeedButton;
    PN_Tocando: TPanel;
    PN_Central: TPanel;
    BT_Testes: TButton;
    LB_testes: TLabel;
    Label1: TLabel;
    BT_Envia_para_serial: TButton;
    BT_Incializacao: TButton;
    PN_Footer: TPanel;
    N2: TMenuItem;
    N1024x600Netbook1: TMenuItem;
    N1024x768VGA431: TMenuItem;
    N1280x720HD1: TMenuItem;
    N4: TMenuItem;
    N1920x10801: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure BT_TOCAR_CAMPAClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
 //   procedure Button2Click(Sender: TObject);
//    procedure FormActivate(Sender: TObject);
    procedure BT_VERIFICA_PROX_HORARIOClick(Sender: TObject);
    procedure BT_LIGAR_PARALELAClick(Sender: TObject);
    procedure SairdoPrograma1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure IM_LogoDblClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure SB_SairClick(Sender: TObject);
    procedure BT_TestesClick(Sender: TObject);
    procedure muda_estado_da_janela(Sender: TObject);
    procedure BT_Envia_para_serialClick(Sender: TObject);
    procedure BT_IncializacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1024x600Netbook1Click(Sender: TObject);
    procedure N1024x768VGA431Click(Sender: TObject);
    procedure N1280x720HD1Click(Sender: TObject);
    procedure N1920x10801Click(Sender: TObject);
    procedure LB_HORARIOSDblClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }



  end;

var
  FPrincipal: TFPrincipal;
  DADOS_H: TextFile;
  NomeDoArquivo: string;
  i: integer;
  Data_Ligado: tDate;
  TOCANDO: Boolean;
  Cont: Integer;


  //COnfigurações do Registro do Windows.
  Config_Bits: String;
  Config_Duracao: String;
  Config_Porta: String;
  Config_arquivomp3: String;
  Config_arquivo_logo: String;

  // Variaveis de configuração salvas no registro do Windows.
  Registro: TRegistry;



  { Variavel usada para enviar o endereços de bits para porta paralela.
   isto indica para qual o led, ou quais os leds irão acender. 0 - apagado - 1 ligado}
  BIN_TEXT, PORTA: String;
  Endereco: integer;
  Dados:  string;
  Full_screen: boolean;

implementation

uses Un_Config, Un_Sobre;

{$R *.dfm}




procedure TFPrincipal.Timer1Timer(Sender: TObject);
Var
    Tempo_restante: TTime;
    DiaDaSemana : String;

begin
      //------- EXIBINDO DATA POR EXTENSO NO PN_DATA ------- RELÓGIO PRINCIPAL --------------------------
        case DayofWeek(date) of
         1 : DiadaSemana := 'Domingo';
         2 : DiadaSemana := 'Segunda-feira';
         3 : DiadaSemana := 'Terça-feira';
         4 : DiadaSemana := 'Quarta-feira';
         5 : DiadaSemana := 'Quinta-feira';
         6 : DiadaSemana := 'Sexta-feira';
         7 : DiadaSemana := 'Sábado';
        End;
        PN_DATA.Caption:= ' '+ DiadaSemana + ', ' +FormatDateTime('dd "de" mmmm "de" yyyy',now);
        // fim da exibição da data


      //MOSTRANDO A HORA ATUAL NO RELÓGIO PRINCIPAL
      PN_RELOGIO.Caption:=TimeToStr(Time);
      PN_PROX_HORARIO.Caption:=LB_HORARIOS.Items.Strings[i];
      // --------------------------------------------------------------------------------------------------


      // TOCA QUANDO REGRESSIVA ZERAR
      if (PN_TEMPO_RESTO.Caption = '00:00:00') Then
        begin
            Tocando:=True;
            BT_TOCAR_CAMPA.Click;
        End;

      Tempo_restante:=StrToTime(LB_HORARIOS.Items.Strings[i]) - Time;
      PN_TEMPO_RESTO.Caption:=TimeToStr(Tempo_restante);

      if (StrToTime(LB_HORARIOS.Items.Strings[i]) < Time ) then
          BT_VERIFICA_PROX_HORARIO.Click;




      if (TOCANDO) and NOT(Cont = -1) Then
        begin
            //BT_LIGAR_PARALELA.Click;
            Dados:='';
            PN_Tocando.Color:=clRed;
            PN_Tocando.Caption:='TOCANDO!';
            PN_Tocando.Caption:=IntToStr(Cont);
            Cont:=Cont -1;
        end
      Else
        Begin
            PN_Tocando.Color:=clSilver;
            PN_Tocando.Caption:='!';
            TOCANDO:=False;
            Dados:= '';
        End;
end;

procedure TFPrincipal.BT_TOCAR_CAMPAClick(Sender: TObject);

begin
try
    MediaPlayer1.FileName:=Config_Arquivomp3;
    MediaPlayer1.Play;  // Executando áudio
    Cont:=StrToInt(Config_Duracao);
    Tocando:=True;
    BT_VERIFICA_PROX_HORARIO.Click;
    BT_Envia_para_serial.Click;
except;
  StatusBar1.Panels[1].Text:='Erro na placa de som';
end;
end;


procedure TFPrincipal.FormCreate(Sender: TObject);
begin
      NomeDoArquivo:='horarios.ini';
end;






procedure TFPrincipal.BT_VERIFICA_PROX_HORARIOClick(Sender: TObject);
Var X: integer;
PROX_HORA: boolean;
begin
      // ESTE PROCEDIMENTO VERIFICA QUAL O HORÁRIO DO PROXIMO TOQUE...
      LB_HORARIOS.ItemIndex:=i;
      X:= LB_Horarios.Items.Count;
      PROX_HORA:=true;
      
      while (PROX_HORA) and (i < X) do
      begin
        if (StrToTime(LB_HORARIOS.Items.Strings[i]) > Time) Then
           begin
                  PN_PROX_HORARIO.Caption:=LB_HORARIOS.Items.Strings[i];
                  PROX_HORA:=false;
           end
        else
           begin
              i:=i+1;
           end;
        LB_HORARIOS.ItemIndex:=i; 
      end;
      if (i = X) then
        begin
          i:=0;
          LB_HORARIOS.ItemIndex:=i;
        end;
      
end;

procedure TFPrincipal.BT_LIGAR_PARALELAClick(Sender: TObject);
begin
    {ESTE PROCEDIEMNTO ATIVA E DESATIVA O LED DA PORTA PARALELA DE PENDENDO DA CONFIGURAÇÃO DA VARIÁVEL DADOS }
    endereco:= 0;
    if (BT_LIGAR_PARALELA.Caption = 'DESLIGADO') Then
        begin
            // enviando dados para porta paralela
        	  dados:='0';
            BT_LIGAR_PARALELA.Caption:='LIGADO';
        End
    Else
        Begin
          // enviando dados para porta paralela
              endereco:= 0;
          	  dados := '0';
              BT_LIGAR_PARALELA.Caption:='DESLIGADO';
         end;
    	
end;

procedure TFPrincipal.SairdoPrograma1Click(Sender: TObject);
begin
      Close;
end;

procedure TFPrincipal.Configuraes1Click(Sender: TObject);
begin
      FConfig.ShowModal;
end;

procedure TFPrincipal.FormDestroy(Sender: TObject);
begin
      Registro.CloseKey;
      Registro.Free;
end;



procedure TFPrincipal.StatusBar1Click(Sender: TObject);
begin
        //Lendo dados das configurações na barra de status
       StatusBar1.Panels[0].Text:='Porta: ' + Config_porta;
       StatusBar1.Panels[1].Text:='Bits: ' + Config_Bits;
       StatusBar1.Panels[2].Text:='Duraçao: ' + Config_duracao + ' segundos';
       StatusBar1.Panels[3].Text:='Arquivo de áudio: ' + Config_Arquivomp3;
       // Aualizando Imagem
       if FileExists(Config_arquivo_logo) Then
         IM_Logo.Picture.LoadFromFile(Config_arquivo_logo);
end;


procedure TFPrincipal.IM_LogoDblClick(Sender: TObject);
begin
      OpenPictureDialog1.Execute;
      Config_arquivo_logo:=OpenPictureDialog1.FileName;
      IM_Logo.Picture.LoadFromFile(Config_arquivo_logo);
      registro.WriteString('arquivo_imagem',Config_arquivo_logo);
end;

procedure TFPrincipal.Sobre1Click(Sender: TObject);
begin
      FSobre.SHowModal;
end;

procedure TFPrincipal.SB_SairClick(Sender: TObject);
begin
      Close;
end;

procedure TFPrincipal.BT_TestesClick(Sender: TObject);
begin
      LB_testes.Caption:= 'Itens (X): ' + IntToStr(LB_HORARIOS.Items.Count);
      Label1.Caption:= 'Valor de i: ' + IntToStr(i);
end;

procedure TFPrincipal.muda_estado_da_janela(Sender: TObject);

begin
    if (Full_screen) then
      begin
        FPrincipal.BorderStyle:=bsSizeable;
        Full_screen:=false;
      end
    else
      begin

        FPrincipal.BorderStyle:=bsNone;
        Full_screen:=true;
      end;


end;

procedure TFPrincipal.BT_Envia_para_serialClick(Sender: TObject);
Var
  TEMPO_ms: integer;
  SEND_TO_SERIAL: string;
begin
try
     with Fconfig do
     begin
        try
            begin
                ComPort.Connected:=true;
                ComPort.Open;
                TEMPO_ms:= StrToInt(Config_Duracao)*1000;
                SEND_TO_SERIAL:=IntToStr(TEMPO_ms);
                ComPort.WriteStr(SEND_TO_SERIAL);
                StatusBar1.Panels[1].Text:='Send: ' + SEND_TO_SERIAL + ' ms';
                Label1.Caption:= Config_Duracao;
                ComPort.Close;
            end;
        except            
              StatusBar1.Panels[1].Text:=('Porta Serial não configurada');
            end;

     End;
except
  StatusBar1.Panels[1].Text:='Dispositivo serial não conectado';
end;

end;

procedure TFPrincipal.BT_IncializacaoClick(Sender: TObject);
//percorrendo o arquivo txt
var   arq: TextFile;
      texto, linha: String;
      cont: integer;


begin
      Full_screen:=false;
      //MOSTRANDO DATA NA BARRA DE ESTATUS - DATA QUE SISTEMA FOI INCIADO...
      Data_Ligado:=Date;
      StatusBar1.Panels[4].Text:='Iniciado em: ' + DateToStr(Data_Ligado) + ' às ' + TimeToStr(Time);

      i:=0;
      TOCANDO:=False;
      LB_HORARIOS.Clear;


      //percorrendo linhas do arquivo txt e adicionando ao ListBox. 
      AssignFile(arq, nomeDoArquivo);
      Reset(arq);
      while (not(Eof(arq))) do
          begin
            ReadLn(arq,linha);
            LB_HORARIOS.Items.Add(linha);
          end;
      CloseFile(arq);


      //Dados de configuração no registro do Windows
      registro := TRegistry.Create;
      registro.RootKey := HKEY_CURRENT_USER;

      // abre a chave (no root selecionado)
      // o segundo parâmetro True, indica que se a chave não existir, a operação de abertura poderá criá-la.
      if NOT(Registro.KeyExists('CAMPA_AUTOMATIZADA')) Then  // Se não existir Crie...
         Begin
             registro.OpenKey('CAMPA_AUTOMATIZADA',True);
             FConfig.ShowModal;
          End
       Else    // e se existir LEIA...
          Begin
              registro.OpenKey('CAMPA_AUTOMATIZADA',False);
              begin
                 Config_porta:=registro.ReadString('Porta');
                 Config_Bits:=registro.ReadString('bits');
                 Config_duracao:=registro.ReadString('Duracao');
                 Config_Arquivomp3:=registro.ReadString('arquivo_mp3');
                 Config_arquivo_logo:=registro.ReadString('arquivo_imagem')
              End;
          End;

          //Atualizando dados para barra de Status
          StatusBar1.Perform(WM_LBUTTONDOWN, 0, 0); //Simula apertar o botão
          StatusBar1.Perform(WM_LBUTTONUP, 0, 0); //Simula soltar o botão (claro)

          MediaPlayer1.FileName:= Config_Arquivomp3;
          FConfig.ComPort.Port:=Config_Porta;

          BT_VERIFICA_PROX_HORARIO.click;


try          //testando o arduino
          with FConfig do
            begin

                begin
                  ComPort.Connected:=true;
                  ComPort.Open;
                  ComPort.ReadStr(texto, cont);
                  StatusBar1.Panels[3].Text:=texto;
                  ComPort.Close;
                end

            end;
            except
              StatusBar1.Panels[3].Text:='Erro no Arduino';
            end;


end;



procedure TFPrincipal.FormActivate(Sender: TObject);
begin
        BT_Incializacao.Click;
end;

procedure TFPrincipal.N1024x600Netbook1Click(Sender: TObject);
begin
      FPrincipal.Width:=1024;
      FPrincipal.Height:=600;
      PN_RELOGIO.Font.Height:=220;
      PN_RELOGIO.Height:=195;

      PN_DATA.Height:=72;
      PN_DATA.Font.Height:=50;

      PN_Footer.Height:=48;

      FPrincipal.Position:=poScreenCenter;

      


end;

procedure TFPrincipal.N1024x768VGA431Click(Sender: TObject);
begin
      FPrincipal.Width:=1024;
      FPrincipal.Height:=768;

      PN_RELOGIO.Height:=250;
      PN_RELOGIO.Font.Height:=240;
      PN_DATA.Height:=100;
      PN_DATA.Font.Height:=58;

      PN_Footer.Height:=120;

      FPrincipal.Position:=poScreenCenter;

end;

procedure TFPrincipal.N1280x720HD1Click(Sender: TObject);
begin
      FPrincipal.Width:=1280;
      FPrincipal.Height:=720;

      PN_RELOGIO.Height:=250;
      PN_RELOGIO.Font.Height:=300;
      PN_DATA.Height:=100;
      PN_DATA.Font.Height:=70;

       PN_Footer.Height:=80;

       FPrincipal.Position:=poScreenCenter;
end;

procedure TFPrincipal.N1920x10801Click(Sender: TObject);
begin
      FPrincipal.Width:=1920;
      FPrincipal.Height:=1080;

      PN_RELOGIO.Height:=400;
      PN_RELOGIO.Font.Height:=360;

      PN_DATA.Height:=170;
      PN_DATA.Font.Height:=90;

      PN_Footer.Height:=140;


      // REPOSICIONANDO ELEMENTOS...

      LB_proximo_horario.Left:=600;
      PN_PROX_HORARIO.Top:=39;
      PN_PROX_HORARIO.Left:=600;
      PN_PROX_HORARIO.Height:=177;
      PN_PROX_HORARIO.Width:=450;


      LB_Tempo_restante.Top:=17;
      LB_Tempo_restante.Left:=1100;
      PN_TEMPO_RESTO.Top:=39;
      PN_TEMPO_RESTO.Left:=1100;
      PN_TEMPO_RESTO.Height:=177;
      PN_TEMPO_RESTO.Width:=450;

      IM_Logo.Width:=270;
      IM_Logo.Height:=270;

      LB_Horarios_Lista.Left:= 320;
      LB_HORARIOS.Width:=250;
      LB_HORARIOS.Height:=240;
      LB_HORARIOS.Left:=320;

      BT_TOCAR_CAMPA.Left:=600;
      BT_TOCAR_CAMPA.Top:=240;
      BT_TOCAR_CAMPA.Width:=950;


      PN_Tocando.Left:=1600;
      PN_Tocando.Height:=265;







      FPrincipal.Position:=poScreenCenter;



end;

procedure TFPrincipal.LB_HORARIOSDblClick(Sender: TObject);
begin
      ShellExecute(Handle,'open',pchar('horarios.ini'),nil,nil,sw_show);
end;

procedure TFPrincipal.Ajuda1Click(Sender: TObject);
begin
      ShellExecute(Handle,'open',pchar('help\index.html'),nil,nil,sw_show);
end;

End.

