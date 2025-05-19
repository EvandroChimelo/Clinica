program Clinica;

uses
  Vcl.Forms,
  UnitCadAgendamentos in 'src\View\UnitCadAgendamentos.pas' {FormCadAgendamentos},
  UnitCadEspecialidadesMedicas in 'src\View\UnitCadEspecialidadesMedicas.pas' {FormCadastrodeEspecialidadesMedica},
  UnitCadMedicos in 'src\View\UnitCadMedicos.pas' {formCadMedicos},
  UnitCadpaciente in 'src\View\UnitCadpaciente.pas' {FormCadPaciente},
  UnitPrincipal in 'src\View\UnitPrincipal.pas' {FormPrincipal},
  UBaseQuery in 'src\DAO\UBaseQuery.pas',
  UConnection in 'src\DAO\UConnection.pas',
  UMedicoDAO in 'src\DAO\UMedicoDAO.pas',
  UPacienteDAO in 'src\DAO\UPacienteDAO.pas',
  UAgendamentoModel in 'src\Model\UAgendamentoModel.pas',
  UMedicosModel in 'src\Model\UMedicosModel.pas',
  UPacienteModel in 'src\Model\UPacienteModel.pas',
  UPessoaModel in 'src\Model\UPessoaModel.pas',
  PacienteController in 'src\Controller\PacienteController.pas',
  EspecialidadeController in 'src\Controller\EspecialidadeController.pas',
  UEspecialidadeDAO in 'src\DAO\UEspecialidadeDAO.pas',
  UEspecialidadeModel in 'src\Model\UEspecialidadeModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.CreateForm(TFormCadastrodeEspecialidadesMedica, FormCadastrodeEspecialidadesMedica);
  Application.CreateForm(TformCadMedicos, formCadMedicos);
  Application.CreateForm(TFormCadPaciente, FormCadPaciente);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.CreateForm(TFormCadastrodeEspecialidadesMedica, FormCadastrodeEspecialidadesMedica);
  Application.CreateForm(TformCadMedicos, formCadMedicos);
  Application.CreateForm(TFormCadPaciente, FormCadPaciente);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadAgendamentos, FormCadAgendamentos);
  Application.CreateForm(TFormCadastrodeEspecialidadesMedica, FormCadastrodeEspecialidadesMedica);
  Application.CreateForm(TformCadMedicos, formCadMedicos);
  Application.CreateForm(TFormCadPaciente, FormCadPaciente);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
