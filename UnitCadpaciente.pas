unit UnitCadpaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Pessoa, PacienteQuery,
  UConexao, FireDAC.Comp.Client;

type
  TFormCadPaciente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    TxtBusca: TEdit;
    Label6: TLabel;
    BtnSalvar: TButton;
    BtnEditar: TButton;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    BtnCancelar: TButton;
    EdtNome: TEdit;
    EdtGid: TEdit;
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
    procedure DBGrid1DblClick(Sender: TObject);

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
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
  try
    Pessoa.Gid := StrToInt(EdtGid.Text); // Captura o gid do paciente selecionado
    Pessoa.CPF := EdtCPF.Text;
    Pessoa.Nome := EdtNome.Text;
    Pessoa.Telefone := EdtTelefone.Text;
    Pessoa.Alterar; // Chama o m�todo para alterar o cadastro no banco
    ShowMessage('Dados atualizados com sucesso!');
  finally
    Pessoa.Free;
  end;

end;

procedure TFormCadPaciente.BtnExcluirClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  if MessageDlg('Tem certeza que deseja excluir este cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Pessoa := TPessoa.Create;
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
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
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
    CarregaPacienteQuery := CarregaPacienteQuery;
    //CarregaPacienteQuery.FQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE gid = :GID';
    CarregaPacienteQuery.CarregarPacientes.ParamByName('GID').AsInteger := PacienteGID;
    CarregaPacienteQuery.CarregarPacientes.Open;
    if not CarregaPacienteQuery.CarregarPacientes.IsEmpty then
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
  DBGrid1.DataSource.DataSet := FPacienteQuery.CarregarPacientes;
end;

procedure TFormCadPaciente.DBGrid1DblClick(Sender: TObject);
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
  DBGrid1.DataSource := FDataSource;
end;

procedure TFormCadPaciente.TxtBuscaChange(Sender: TObject);
var
  PacientesQuery: TPacienteQuery;
begin
  PacientesQuery := TPacienteQuery.Create(FConnection);
  DBGrid1.DataSource.DataSet := PacientesQuery.BuscarPacientepornome(TxtBusca.Text);
end;

end.
