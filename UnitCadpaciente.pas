unit UnitCadpaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Pessoa;

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
  private
    { Private declarations }
  public
    { Public declarations }
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
    Pessoa.Alterar; // Chama o método para alterar o cadastro no banco
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
      Pessoa.Excluir; // Chama o método de exclusão
      ShowMessage('Cadastro excluído com sucesso!');
    finally
      Pessoa.Free;
    end;
  end;
end;

procedure TFormCadPaciente.BtnIncluirClick(Sender: TObject);
begin
 // Limpa os campos para garantir que não haja dados antigos
  EdtNome.Clear;
  EdtCPF.Clear;
  EdtTelefone.Clear;
  EdtDataCadastro.Clear;
  // Habilita os campos para inserção
  EdtNome.Enabled := True;
  EdtCPF.Enabled := True;
  EdtTelefone.Enabled := True;
  EdtDataCadastro.Enabled := True;
  // Ajusta a visibilidade dos botões
  BtnIncluir.Enabled := False;
  BtnEditar.Enabled := False;
  BtnSalvar.Enabled := True;
  BtnExcluir.Enabled := False;
  BtnCancelar.Enabled := True;
  // Deixa o foco no primeiro campo de edição
  EdtCPF.SetFocus;

end;

procedure TFormCadPaciente.BtnSalvarClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
    try
      // Configurar os dados da Pessoa com base nos campos de entrada
      Pessoa.Gid := 0;
      Pessoa.CPF := EdtCPF.Text;
      pessoa.Nome := EdtNome.Text;
      Pessoa.Telefone := EdtTelefone.Text;
      EdtDataCadastro.Text := DateToStr(Date);
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

       // Desabilitar os campos de edição após salvar
       EdtNome.Enabled := False;
       EdtCPF.Enabled := False;
       EdtTelefone.Enabled := False;

       // Ajustar o estado dos botões
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

procedure TFormCadPaciente.TxtBuscaChange(Sender: TObject);
begin
  //dm.tbPaciente.Locate('nome', TxtBusca.Text, [loPartialKey]);
end;

end.
