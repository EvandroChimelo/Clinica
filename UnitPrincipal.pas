unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Imaging.jpeg,
  UnitCadpaciente, UnitCadAgendamentos, UnitCadEspecialidadesMedicas, UnitCadMedicos;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Pacientes1: TMenuItem;
    Agendamento1: TMenuItem;
    Panel1: TPanel;
    btnEspecialidadeMedica: TBitBtn;
    btnMedicos: TBitBtn;
    Image1: TImage;
    btnAgendamento: TBitBtn;
    btnPaciente: TBitBtn;
    procedure Sair1Click(Sender: TObject);
    procedure PacientesClick(Sender: TObject);
    procedure Agendamento1Click(Sender: TObject);
    procedure btnMedicosClick(Sender: TObject);
    procedure btnEspecialidadeMedicaClick(Sender: TObject);
    procedure btnAgendamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.Agendamento1Click(Sender: TObject);
begin
  FormCadAgendamentos.showModal;
end;

procedure TFormPrincipal.btnAgendamentoClick(Sender: TObject);
begin
 FormCadAgendamentos.ShowModal;
end;

procedure TFormPrincipal.btnEspecialidadeMedicaClick(Sender: TObject);
begin
  FormCadastrodeEspecialidadesMedica.ShowModal;
end;

procedure TFormPrincipal.btnMedicosClick(Sender: TObject);
begin
   formCadMedicos.ShowModal;
end;

procedure TFormPrincipal.PacientesClick(Sender: TObject);
begin
 FormCadPaciente.ShowModal;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
 Application.Terminate;
end;

end.
