unit UnitCadpaciente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,
  UPacienteModel,
  PacienteController;

type
   TCadastroState = (csNavegando, csInserindo, csEditando);

  TFormCadPaciente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCodPaciente: TLabel;
    lbCPFPaciente: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    gridcadastropaciente: TDBGrid;
    TxtBusca: TEdit;
    Label6: TLabel;
    BtnSalvar: TButton;
    BtnEditar: TButton;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    BtnCancelar: TButton;
    EdtNome: TEdit;
    edtGid: TEdit;
    EdtCPF: TEdit;
    EdtTelefone: TEdit;
    EdtDataCadastro: TEdit;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure TxtBuscaChange(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridcadastropacienteDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    FPacienteController : TPacienteController;
    FDataSource: TDataSource;
    procedure CarregarGrid;
  public
   procedure LimparCamposEControlarBotoes(AState: TCadastroState);
end;

var
  FormCadPaciente: TFormCadPaciente;

implementation

{$R *.dfm}

procedure TFormCadPaciente.BtnCancelarClick(Sender: TObject);
begin
  LimparCamposEControlarBotoes(csNavegando);
end;

procedure TFormCadPaciente.BtnEditarClick(Sender: TObject);
var
  LPaciente: TPacienteModel;
  LGIDSelecionado: Integer;
begin
  if not FDataSource.DataSet.IsEmpty then
  begin
    LGIDSelecionado := FDataSource.DataSet.FieldByName('GID').AsInteger;
    LPaciente := FPacienteController.CarregarPaciente(LGIDSelecionado); // Controller busca o paciente
    if Assigned(LPaciente) then
    try
      // Popular campos da UI com dados do Model
      EdtGid.Text := IntToStr(LPaciente.Gid);
      EdtNome.Text := LPaciente.Nome;
      EdtCPF.Text := LPaciente.CPF;
      EdtTelefone.Text := LPaciente.Telefone;
      // EdtDataCadastro.Text := DateToStr(LPaciente.DataCadastro);

      LimparCamposEControlarBotoes(csEditando); // csEditando = outro estado
      EdtNome.SetFocus;
    finally
      LPaciente.Free;
    end
    else
      ShowMessage('Paciente não encontrado.');
  end
  else
    ShowMessage('Nenhum registro selecionado para edição.');
end;

procedure TFormCadPaciente.BtnExcluirClick(Sender: TObject);
var
  LGIDSelecionado: Integer;
begin
  if not FDataSource.DataSet.IsEmpty then
  begin
    if MessageDlg('Tem certeza que deseja excluir este cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      LGIDSelecionado := gridcadastropaciente.DataSource.DataSet.FieldByName('GID').AsInteger;
      //LGIDSelecionado := StrToIntDef(EdtGid.Text, 0); // Ou pegar do grid se mais confiável
                                                    // Ou melhor, se estiver em modo edição, o GID já está no EdtGid
      if LGIDSelecionado > 0 then // Garante que tem um GID válido
      begin
        if FPacienteController.ExcluirPaciente(LGIDSelecionado) then
        begin
          ShowMessage('Cadastro excluído com sucesso!');
          CarregarGrid;
          LimparCamposEControlarBotoes(csNavegando);
        end
        else
          ShowMessage('Erro ao excluir paciente.');
      end
      else
        ShowMessage('Nenhum paciente selecionado ou GID inválido para exclusão.');
    end;
  end
  else
    ShowMessage('Nenhum registro selecionado para exclusão.');
end;

procedure TFormCadPaciente.BtnIncluirClick(Sender: TObject);
begin
  LimparCamposEControlarBotoes(csInserindo); // csInserindo = outro estado
  EdtDataCadastro.Text := DateToStr(Date); // Data de cadastro padrão
  EdtGid.Text := '0'; // Indica novo registro
  EdtCPF.SetFocus;
end;

procedure TFormCadPaciente.BtnSalvarClick(Sender: TObject);
var
  LPaciente: TPacienteModel;
  LGIDSalvo: Integer;
begin
  LPaciente := TPacienteModel.Create;
    try
      // Configurar os dados da Pessoa com base nos campos de entrada
      LPaciente.Gid := StrToIntDef(EdtGid.Text, 0);
      LPaciente.Nome := EdtNome.Text;
      LPaciente.CPF := EdtCPF.Text;
      LPaciente.Telefone := EdtTelefone.Text;

       // O método SalvarPaciente no Controller decide se é INSERT ou UPDATE baseado no GID
      LGIDSalvo := FPacienteController.SalvarPaciente(LPaciente);


      if LGIDSalvo > 0 then
      begin

      ShowMessage('Dados salvos com sucesso! GID: ' + IntToStr(LGIDSalvo));
      EdtGid.Text := IntToStr(LGIDSalvo); // Atualiza GID na tela
      CarregarGrid; // Atualiza o grid
      LimparCamposEControlarBotoes(csNavegando); // csNavegando = um estado
    end
    else
    begin
      ShowMessage('Erro ao salvar paciente.');
    end;
  finally
    LPaciente.Free;
  end;
end;

procedure TFormCadPaciente.CarregarGrid;
begin
  FDataSource.DataSet := FPacienteController.CarregarListaPacienteParaGrid;
end;

procedure TFormCadPaciente.gridcadastropacienteDblClick(Sender: TObject);
begin
  BtnEditarClick(Sender);
end;

procedure TFormCadPaciente.LimparCamposEControlarBotoes(AState: TCadastroState);
begin
  // Limpar campos
  if AState <> csEditando then // Não limpa se estiver editando, pois os dados já foram carregados
  begin
    EdtNome.Clear;
    EdtCPF.Clear;
    EdtTelefone.Clear;
    EdtDataCadastro.Clear;
    EdtGid.Clear;
  end;

  // Habilitar/Desabilitar campos
  EdtNome.Enabled := (AState = csInserindo) or (AState = csEditando);
  EdtCPF.Enabled := (AState = csInserindo) or (AState = csEditando);
  EdtTelefone.Enabled := (AState = csInserindo) or (AState = csEditando);
  EdtDataCadastro.Enabled := False; // Geralmente não editável diretamente

  // Controlar botões
  BtnIncluir.Enabled := (AState = csNavegando);
  BtnEditar.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnExcluir.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnSalvar.Enabled := (AState = csInserindo) or (AState = csEditando);
  BtnCancelar.Enabled := (AState = csInserindo) or (AState = csEditando);

  //if AState = csNavegando then
  //gridcadastropaciente.SetFocus;
end;

procedure TFormCadPaciente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FPacienteController);
  FreeAndNil(FDataSource);
end;

procedure TFormCadPaciente.FormCreate(Sender: TObject);
begin
  FPacienteController := TPacienteController.Create; // O create da Query recebe a conexão e não nil
  FDataSource := TDataSource.Create(Self);
  gridcadastropaciente.DataSource := FDataSource;
  CarregarGrid;
  LimparCamposEControlarBotoes(csNavegando);
end;

procedure TFormCadPaciente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  shif: TShiftState;
begin
     if key = VK_ESCAPE then
      Close;
end;

procedure TFormCadPaciente.TxtBuscaChange(Sender: TObject);
var
  PacientesQuery: TPacienteController;
begin
  FDataSource.DataSet := FPacienteController.BuscarPacientePorNomeParaGrid(TxtBusca.Text);
end;

end.
