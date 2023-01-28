program Project_Calculadora;

uses
  Vcl.Forms,
  uform_calculadora in 'uform_calculadora.pas' {FormCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCalculadora, FormCalculadora);
  Application.Run;
end.
