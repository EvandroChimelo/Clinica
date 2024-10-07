program Clinica;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadpaciente in 'UnitCadpaciente.pas' {FormCadPaciente},
  UnitCadAgendamentos in 'UnitCadAgendamentos.pas' {FormCadAgendamentos},
  UConexao in 'src\UConexao.pas',
  Pessoa in 'src\Pessoa.pas',
  PacienteQuery in 'src\PacienteQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadPaciente, FormCadPaciente);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.Run;
end.
