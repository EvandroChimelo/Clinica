program Clinica;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadpaciente in 'UnitCadpaciente.pas' {FormCadPaciente},
  UnitCadAgendamentos in 'UnitCadAgendamentos.pas' {FormCadAgendamentos},
  UConexao in 'src\UConexao.pas',
  Pessoa in 'src\Pessoa.pas',
  PacienteQuery in 'src\PacienteQuery.pas',
  Paciente in 'src\Paciente.pas',
  Agendamento in 'src\Agendamento.pas',
  QueryBase in 'src\QueryBase.pas',
  Medicos in 'src\Medicos.pas',
  UnitCadEspecialidadesMedicas in 'UnitCadEspecialidadesMedicas.pas' {FormCadastrodeEspecialidadesMedica},
  CadEspecialidade in 'src\CadEspecialidade.pas',
  UnitCadMedicos in 'UnitCadMedicos.pas' {formCadMedicos},
  CadEspecialidadeQuery in 'src\CadEspecialidadeQuery.pas',
  MedicoQuery in 'src\MedicoQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadPaciente, FormCadPaciente);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.CreateForm(TFormCadastrodeEspecialidadesMedica, FormCadastrodeEspecialidadesMedica);
  Application.CreateForm(TformCadMedicos, formCadMedicos);
  Application.Run;
end.
