unit UnitCadMedicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UMedicosModel;

type
  TformCadMedicos = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblCadastroMedico: TLabel;
    Panel1: TPanel;
    lbCadastroMedico: TLabel;
    gridcadastropaciente: TDBGrid;
    TxtBusca: TEdit;
    BtnSalvar: TButton;
    BtnEditar: TButton;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    BtnCancelar: TButton;
    edtNome: TEdit;
    edtGidMedico: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtDataCadastro: TEdit;
    lbCRM: TLabel;
    edtCRM: TEdit;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    FMedicos: TMedicos;
  public
    { Public declarations }
  end;

var
  formCadMedicos: TformCadMedicos;

implementation

{$R *.dfm}

procedure TformCadMedicos.BtnCancelarClick(Sender: TObject);
begin
  edtNome.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtDataCadastro.Clear;
  edtCRM.Clear;

  edtNome.Enabled := False;
  edtTelefone.Enabled := False;
  edtCPF.Enabled := False;
  edtDataCadastro.Enabled := False;
  edtCRM.Enabled := False;
  BtnIncluir.Enabled := True;
  BtnEditar.Enabled := True;
  BtnSalvar.Enabled := False;
  BtnExcluir.Enabled := True;
  BtnCancelar.Enabled := False;
end;

procedure TformCadMedicos.BtnIncluirClick(Sender: TObject);
begin
  // Limpa os campos para garantir que não haja dados antigos
  edtNome.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtDataCadastro.clear;
  edtCRM.Clear;

   // Habilita os campos para inserção
  edtCPF.Enabled := True;
  edtNome.Enabled := True;
  edtTelefone.Enabled := True;
  edtDataCadastro.Enabled := False;
  edtDataCadastro.Text := DateToStr(Date);
  edtCRM.Enabled := True;

  // Ajusta a visibilidade dos botões
  BtnIncluir.Enabled := False;
  BtnEditar.Enabled := False;
  BtnSalvar.Enabled := True;
  BtnExcluir.Enabled := False;
  BtnCancelar.Enabled := True;

  // Deixa o foco no primeiro campo de edição
  edtCPF.SetFocus;
end;

procedure TformCadMedicos.BtnSalvarClick(Sender: TObject);
var
  FMedico: TMedicos;
begin
  FMedico := TMedicos.Create;
  try
    // Preenche os dados da tela no objeto
    FMedicos.Nome     := edtNome.Text;
    FMedicos.CPF      := edtCPF.Text;
    FMedicos.Telefone := edtTelefone.Text;
    FMedicos.CRM      := edtCRM.Text;


    FMedico.Salvar;
     ShowMessage('Cadastro realizado com sucesso!');
  finally
    FMedico.Free;
  end;

end;

end.
