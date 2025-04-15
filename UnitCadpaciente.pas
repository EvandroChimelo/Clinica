unit UnitCadpaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, PacienteQuery, UConexao, FireDAC.Comp.Client,
  Paciente;

type
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
    FPacienteQuery : TPacienteQuery;
    FConnection : TConnection;
    FDataSource: TDataSource;
    procedure CarregarPaciente;
  public
    procedure CarregarDadosPaciente(PacienteGID : Integer);

  end;

var
  FormCadPaciente: TFormCadPaciente;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFormCadPaciente.BtnCancelarClick(Sender: TObject);
begin
  EdtNome.Clear;
  EdtCPF.Clear;
  EdtTelefone.Clear;
  EdtDataCadastro.Clear;

  EdtNome.Enabled := False;
  EdtTelefone.Enabled := False;
  EdtCPF.Enabled := False;
  EdtDataCadastro.Enabled := False;
  BtnIncluir.Enabled := True;
  BtnEditar.Enabled := True;
  BtnSalvar.Enabled := False;
  BtnExcluir.Enabled := True;
  BtnCancelar.Enabled := False;
end;

procedure TFormCadPaciente.BtnEditarClick(Sender: TObject);
var
  Pessoa: TPaciente;
  GIDSelecionado: Integer;
begin
  // Verifica se h� um registro selecionado no DBGrid
    if not gridcadastropaciente.DataSource.DataSet.IsEmpty then
    begin
       // Pessoa := TPaciente.Create;
    // Captura o GID do paciente selecionado
      GIDSelecionado := gridcadastropaciente.DataSource.DataSet.FieldByName('GID').AsInteger;

      // Exibe o GID capturado no campo EdtGid (opcional)
      EdtGid.Text := IntToStr(GIDSelecionado);

      // Carrega os dados do paciente nos campos de edi��o
    CarregarDadosPaciente(GIDSelecionado);

      // Habilita os campos para edi��o
      EdtNome.Enabled := True;
      EdtTelefone.Enabled := True;
      EdtCPF.Enabled := True;
      EdtDataCadastro.Enabled := False; // Data geralmente n�o � edit�vel

      // Ajusta a visibilidade dos bot�es
      BtnSalvar.Enabled := True;
      BtnCancelar.Enabled := True;
      BtnIncluir.Enabled := False;
      BtnExcluir.Enabled := False;
      BtnEditar.Enabled := False;

      // Foco no primeiro campo edit�vel
      EdtNome.SetFocus;
  end
  else
  begin
    ShowMessage('Nenhum registro selecionado para edi��o.');
  end;

       //.Gid := StrToInt(EdtGid.Text); // Captura o gid do paciente selecionado
       //.CPF := EdtCPF.Text;
       //.Nome := EdtNome.Text;
       //.Telefone := EdtTelefone.Text;
       //.Alterar; // Chama o m�todo para alterar o cadastro no banco
       //ShowMessage('Dados atualizados com sucesso!');

end;

procedure TFormCadPaciente.BtnExcluirClick(Sender: TObject);
var
  Pessoa: TPaciente;
begin
  if MessageDlg('Tem certeza que deseja excluir este cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Pessoa := TPaciente.Create;
    try
      Pessoa.Gid := StrToInt(EdtGid.Text); // Captura o gid do paciente
      Pessoa.Excluir; // Chama o m�todo de exclus�o
      ShowMessage('Cadastro exclu�do com sucesso!');
    finally
      Pessoa.Free;
    end;
  end;
end;

procedure TFormCadPaciente.BtnIncluirClick(Sender: TObject);
begin
 // Limpa os campos para garantir que n�o haja dados antigos
  EdtNome.Clear;
  EdtCPF.Clear;
  EdtTelefone.Clear;
  EdtDataCadastro.Clear;

  // Habilita os campos para inser��o
  EdtNome.Enabled := True;
  EdtCPF.Enabled := True;
  EdtTelefone.Enabled := True;
  EdtDataCadastro.Enabled := False;
  EdtDataCadastro.Text := DateToStr(Date);
  EdtGid.Text := '0000';

  // Ajusta a visibilidade dos bot�es
  BtnIncluir.Enabled := False;
  BtnEditar.Enabled := False;
  BtnSalvar.Enabled := True;
  BtnExcluir.Enabled := False;
  BtnCancelar.Enabled := True;

  // Deixa o foco no primeiro campo de edi��o
  EdtCPF.SetFocus;

end;

procedure TFormCadPaciente.BtnSalvarClick(Sender: TObject);
var
  Pessoa: TPaciente;
begin
  Pessoa := TPaciente.Create;
    try
      // Configurar os dados da Pessoa com base nos campos de entrada
      Pessoa.CPF := EdtCPF.Text;
      pessoa.Nome := EdtNome.Text;
      Pessoa.Telefone := EdtTelefone.Text;
      // Salvar a Pessoa no banco de dados
      pessoa.Save;
      // Atualizar o campo EdtGid com o GID gerado pelo banco de dados
      EdtGid.Text := IntToStr(Pessoa.Gid);

       ShowMessage('Dados salvos com sucesso!');

       // Limpar os campos de entrada
       EdtNome.Clear;
       EdtCPF.Clear;
       EdtTelefone.Clear;
       EdtDataCadastro.Clear;

       // Desabilitar os campos de edi��o ap�s salvar
       EdtNome.Enabled := False;
       EdtCPF.Enabled := False;
       EdtTelefone.Enabled := False;

       // Ajustar o estado dos bot�es
       BtnSalvar.Enabled := False;
       BtnIncluir.Enabled := True;
       BtnEditar.Enabled := True;
       BtnExcluir.Enabled := True;
       BtnCancelar.Enabled := False;

    finally
      Pessoa.Free;
    end;

    EdtGid.Text := IntToStr(Pessoa.Gid);
end;

procedure TFormCadPaciente.CarregarDadosPaciente(PacienteGID : Integer);
var
  CarregaPacienteQuery: TPacienteQuery;
begin
  // Usando a conex�o existente
  CarregaPacienteQuery := TPacienteQuery.Create(FConnection);
  try
    CarregaPacienteQuery.GetQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE gid = :GID';
    //CarregaPacienteQuery := CarregaPacienteQuery;
//    CarregaPacienteQuery.FQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE gid = :GID';
    CarregaPacienteQuery.GetQuery.ParamByName('GID').AsInteger := PacienteGID;
    CarregaPacienteQuery.CarregarPacientes.Open;

    if not CarregaPacienteQuery.GetQuery.IsEmpty then
    begin
      // Carrega os dados nos campos de edi��o
      EdtNome.Text := CarregaPacienteQuery.CarregarPacientes.FieldByName('nome').AsString;
      EdtCPF.Text := CarregaPacienteQuery.CarregarPacientes.FieldByName('cpf').AsString;
      EdtTelefone.Text := CarregaPacienteQuery.CarregarPacientes.FieldByName('telefone').AsString;
      EdtDataCadastro.Text := CarregaPacienteQuery.CarregarPacientes.FieldByName('datacadastro').AsString;
    end;
  finally
    CarregaPacienteQuery.Free;
  end;
end;

procedure TFormCadPaciente.CarregarPaciente;
var
  PacientesQuery: TPacienteQuery;
begin
  // Certifique-se de que a conex�o j� est� criada
  FPacienteQuery := FPacienteQuery.create(FConnection);
  gridcadastropaciente.DataSource.DataSet := FPacienteQuery.CarregarPacientes;
end;

procedure TFormCadPaciente.gridcadastropacienteDblClick(Sender: TObject);
var
  PacienteGID : integer;
begin
//  //Obt�m o ID do paciente da linha selecionada
//  PacienteGID := DBGrid1.DataSource.DataSet.FieldByName('GID').AsInteger;
//
//  // Chama o procedimento que carrega os dados nos campos de edi��o
//  CarregarPaciente(PacienteGID);

end;

procedure TFormCadPaciente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConnection.Desconectar;
  FreeAndNil(FPacienteQuery);
  FreeAndNil(FDataSource);
  FreeAndNil(FConnection);
end;

procedure TFormCadPaciente.FormCreate(Sender: TObject);
begin
  FConnection := TConnection.Create;
  FConnection.Conectar;

  FPacienteQuery := TPacienteQuery.Create(FConnection); // O create da Query recebe a conex�o e n�o nil
  FDataSource := TDataSource.Create(Self);
  FDataSource.DataSet := FPacienteQuery.CarregarPacientes;
  gridcadastropaciente.DataSource := FDataSource;

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
  PacientesQuery: TPacienteQuery;
begin
  PacientesQuery := TPacienteQuery.Create(FConnection);
  gridcadastropaciente.SetFocus;
  gridcadastropaciente.DataSource.DataSet := PacientesQuery.BuscarPacientepornome(TxtBusca.Text);
end;

end.
