unit UnitCadEspecialidadesMedicas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  EspecialidadeController,
  UEspecialidadeModel;

type
  TCadastroState = (csNavegando, csInserindo, csEditando);
  {...}

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
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);


    private
      FEspecialidadeController: TEspecialidadeController;
      FDataSource: TDataSource;
    procedure CarregarGrid;

    public
      procedure LimparCamposEControlarBotoes(AState: TCadastroState);
  end;

var
  FormCadastrodeEspecialidadesMedica: TFormCadastrodeEspecialidadesMedica;

{$R *.dfm}

implementation

procedure TFormCadastrodeEspecialidadesMedica.CarregarGrid;
begin
  FDataSource.DataSet := FEspecialidadeController.CarregarEspecialidadeMedicaParaGrid;
end;

procedure TFormCadastrodeEspecialidadesMedica.btnEditarClick(Sender: TObject);
var
  LEspecialidade: TEspecialidadeModel;
  LGIDSelecionado: Integer;
begin
  if FDataSource.DataSet.IsEmpty then
    begin
      LGIDSelecionado := FDataSource.DataSet.FieldByName('GID').AsInteger;
      LEspecialidade := FEspecialidadeController.CarregarEspecialidade(LGIDSelecionado);
        if Assigned(LEspecialidade) then
         try
            edtcodigoespecialidade.Text := IntToStr(LEspecialidade.GIDEspecialidade);
            edtNomeEspecialidadeMedica.Text := LEspecialidade.NomeEspecialidade;

            LimparCamposEControlarBotoes(csEditando);
            edtNomeEspecialidadeMedica.SetFocus;            
         finally
            LEspecialidade.Free;
         end
         else
          ShowMessage('Especialidade não encontrada');
    end
     else
    ShowMessage('Nenhum registro Selecionado');
end;

procedure TFormCadastrodeEspecialidadesMedica.btnIncluirClick(Sender: TObject);
begin
  LimparCamposEControlarBotoes(csInserindo);
  edtcodigoespecialidade.Text := '0';
  edtNomeEspecialidadeMedica.SetFocus;
end;

procedure TFormCadastrodeEspecialidadesMedica.btnSalvarClick(Sender: TObject);
var
  LEspecialidade: TEspecialidadeModel;
  LGIDSalvo: Integer;
begin
   LEspecialidade.Create;
   try
      LEspecialidade.GIDEspecialidade := StrToIntDef(edtcodigoespecialidade.Text, 0);
      LEspecialidade.NomeEspecialidade := edtNomeEspecialidadeMedica.Text;

       // O método SalvarPaciente no Controller decide se é INSERT ou UPDATE baseado no GID
       LGIDSalvo := FEspecialidadeController.SalvarEspecialidade(LEspecialidade);

   if LGIDSalvo > 0 then
      begin
      ShowMessage('Dados salvos com sucesso! GID: ' + IntToStr(LGIDSalvo));
      edtcodigoespecialidade.Text := IntToStr(LGIDSalvo); // Atualiza GID na tela
      CarregarGrid; // Atualiza o grid
      LimparCamposEControlarBotoes(csNavegando); // csNavegando = um estado
    end
    else
    begin
      ShowMessage('Erro ao salvar paciente.');
    end;
  finally
    LEspecialidade.Free;
  end;

end;

procedure TFormCadastrodeEspecialidadesMedica.LimparCamposEControlarBotoes( AState: TCadastroState);
begin
  // Limpar campos
  if AState <> csEditando then // Não limpa se estiver editando, pois os dados já foram carregados
  begin
    edtcodigoespecialidade.Clear;
    edtNomeEspecialidadeMedica.Clear;
  end;

  // Habilitar/Desabilitar campos
  edtNomeEspecialidadeMedica.Enabled := (AState = csInserindo) or (AState = csEditando);

  // Controlar botões
  BtnIncluir.Enabled := (AState = csNavegando);
  BtnEditar.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnExcluir.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnSalvar.Enabled := (AState = csInserindo) or (AState = csEditando);
  BtnCancelar.Enabled := (AState = csInserindo) or (AState = csEditando);

  if AState = csNavegando then
    gridEspecialidadeMedica.SetFocus;
end;

end.
