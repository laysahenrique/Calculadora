unit uform_calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TOperacao = (OSoma, OSubitracao, OMultiplicacao, ODivisao, ORaiz, OExpoente,
  OFracao, OProcentagem);

type
  TFormCalculadora = class(TForm)
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btnMaisMenos: TButton;
    btn0: TButton;
    btnVirgula: TButton;
    btnExpoente: TButton;
    btnRaiz: TButton;
    btnFracao: TButton;
    btnLimparLinha: TButton;
    btnApagar: TButton;
    btnResto: TButton;
    btnMultiplicacao: TButton;
    btnSubitracao: TButton;
    btnSoma: TButton;
    btnIgualdade: TButton;
    btnDivisao: TButton;
    btnLimparUltimoNumero: TButton;
    EditResultado: TEdit;
    PanelFundo: TPanel;
    procedure btnSomaClick(Sender: TObject);
    procedure btnSubitracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMultiplicacaoClick(Sender: TObject);
    procedure btnDivisaoClick(Sender: TObject);
    procedure btnRaizClick(Sender: TObject);
    procedure btnExpoenteClick(Sender: TObject);
    procedure btnFracaoClick(Sender: TObject);
    procedure btnRestoClick(Sender: TObject);
    procedure btnIgualdadeClick(Sender: TObject);
    procedure btnNumClick(Sender: TObject);
    procedure btnMaisMenosClick(Sender: TObject);
    procedure btnLimparLinhaClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnLimparUltimoNumeroClick(Sender: TObject);

  private
    function Calculo():Double;
  public
    { Public declarations }
  end;

var
  FormCalculadora: TFormCalculadora;
  NumAnterior: Double;
  NumAtual: Double;
  Total:Double;
  NumAux:Double;
  Valor: TOperacao;

implementation

{$R *.dfm}

{ TFormCalculadora }

procedure TFormCalculadora.btnNumClick(Sender: TObject);
begin
  if(NumAtual = 0) then
   EditResultado.Text := TButton(Sender).Caption
  else
   EditResultado.Text := EditResultado.Text + TButton(Sender).Caption;

  NumAtual:= StrToFloat(EditResultado.Text);
end;

procedure TFormCalculadora.btnApagarClick(Sender: TObject);
begin
  EditResultado.Clear;
  Total:=0;
  EditResultado.Text:='0';
end;

procedure TFormCalculadora.btnDivisaoClick(Sender: TObject);
begin
  NumAnterior:= StrToFloat(EditResultado.Text);
  Valor:=ODivisao;
  NumAtual:= 0;
end;

procedure TFormCalculadora.btnExpoenteClick(Sender: TObject);
begin
  Valor:=OExpoente;
  Calculo();
end;

procedure TFormCalculadora.btnFracaoClick(Sender: TObject);
begin
  Valor:=OFracao;
  Calculo();
end;

procedure TFormCalculadora.btnIgualdadeClick(Sender: TObject);
begin
  NumAtual:= StrToFloat(EditResultado.Text);
  Calculo();
end;

procedure TFormCalculadora.btnLimparLinhaClick(Sender: TObject);
begin
EditResultado.Text:='0';
end;

procedure TFormCalculadora.btnLimparUltimoNumeroClick(Sender: TObject);
var Dell:string;
begin
  Dell:= copy(EditResultado.text,1,length(EditResultado.text)-1);

  if(Dell = '') then
   EditResultado.text := '0'
  else
   EditResultado.text := Dell;
end;

procedure TFormCalculadora.btnMaisMenosClick(Sender: TObject);
var
   aux:Double;
begin
   aux := StrToFloat(EditResultado.Text);
   if aux > 0 then
   begin
     EditResultado.Text := FloatToStr(-aux);
     NumAtual:= -aux;
   end
  else if aux < 0 then
   begin
     EditResultado.Text := FloatToStr(+aux);
     NumAtual:= +aux;
   end;
end;

procedure TFormCalculadora.btnMultiplicacaoClick(Sender: TObject);
begin
  NumAnterior:= StrToFloat(EditResultado.Text);
  Valor:= OMultiplicacao;
  NumAtual:= 0;
end;

procedure TFormCalculadora.btnRaizClick(Sender: TObject);
begin
  Valor := ORaiz;
  Calculo();
end;

procedure TFormCalculadora.btnRestoClick(Sender: TObject);
begin
  Valor:=OProcentagem;
  Calculo();
end;

procedure TFormCalculadora.btnSomaClick(Sender: TObject);
begin
  NumAnterior := StrToFloat(EditResultado.Text);
  Valor := OSoma;
  NumAtual:= 0;
end;

procedure TFormCalculadora.btnSubitracaoClick(Sender: TObject);
begin
  NumAnterior:= StrToFloat(EditResultado.Text);
  Valor:= OSubitracao;
  NumAtual:= 0;
end;

function TFormCalculadora.Calculo: Double;
begin
     case Valor of
        OSoma: Total := NumAnterior + NumAtual;
        OSubitracao: Total := NumAnterior - NumAtual;
        OMultiplicacao: Total := NumAnterior * NumAtual;
        ODivisao: Total := NumAnterior / NumAtual;
        ORaiz: Total := sqrt(NumAtual);
        OExpoente: Total := NumAtual * NumAtual;
        OFracao: Total := 1 / NumAtual;
        OProcentagem: Total := NumAtual/100;

   end;
   EditResultado.Text := FloatToStr(Total);
   NumAtual:= 0;
end;

procedure TFormCalculadora.FormShow(Sender: TObject);
begin
  NumAtual:= 0;
  EditResultado.Text := '0';
  NumAtual:= 0;
end;
end.
