unit UnitCadEspecialidadesMedicas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  uconexao, Querybase, CadEspecialidadeQuery;

type
  TFormCadastrodeEspecialidadesMedica = class(TForm)
    edtcodigoespecialidade: TEdit;
    lblCodigoEspecialidade: TLabel;
    gridEspecialidadeMedica: TDBGrid;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    lblNomeEspecialidadeMedica: TLabel;
    edtNomeEspecialidadeMedica: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  end;

var
  FormCadastrodeEspecialidadesMedica: TFormCadastrodeEspecialidadesMedica;

implementation

uses
  CadEspecialidade;

{$R *.dfm}

procedure TFormCadastrodeEspecialidadesMedica.btnIncluirClick(Sender: TObject);
begin
  //limpa campos para pode inserir novos dados
  edtcodigoespecialidade.Clear;
  edtNomeEspecialidadeMedica.clear;

  //habilita para digitar

  edtcodigoespecialidade.Enabled := False;
  edtNomeEspecialidadeMedica.Enabled := True;

  //Ajustar botoes para ativar ou desativar
  btnIncluir.Enabled := False;
  btnEditar.Enabled := False;
  btnSalvar.Enabled := True;
  btnExcluir.Enabled := False;
  btnCancelar.Enabled := True;

  // Foco para digitar o nome
  edtNomeEspecialidadeMedica.SetFocus;

end;

procedure TFormCadastrodeEspecialidadesMedica.btnSalvarClick(Sender: TObject);
var
  LEspecialidadeMedica : TCadastroEspecialidade;
begin

  try
    LEspecialidadeMedica.Create();

    LEspecialidadeMedica.NomeEspecialidade := edtNomeEspecialidadeMedica.Text;

    LEspecialidadeMedica.SalvarEspecialidade;
  finally
  FreeAndNil(LEspecialidadeMedica);

  end;
end;

end.
