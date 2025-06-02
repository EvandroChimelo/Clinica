unit UnitCadMedicos;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  UMedicosModel,
  MedicoController;

type

  TCadastroState = (csNavegando, csInserindo, csEditando);

  TformCadMedicos = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblCadastroMedico: TLabel;
    Panel1: TPanel;
    lbCadastroMedico: TLabel;
    gridCadastroMedico: TDBGrid;
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
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
  private
    FMedicoController: TMedicoController;
    FDataSource: TDataSource;

    procedure LimparCamposEControlarBotoes(AState: TCadastroState);
    procedure CarregarGrid;
  public
    { Public declarations }
  end;

var
  formCadMedicos: TformCadMedicos;

implementation

{$R *.dfm}

procedure TformCadMedicos.BtnIncluirClick(Sender: TObject);
begin
  LimparCamposEControlarBotoes(csInserindo); // csInserindo = outro estado
  EdtDataCadastro.Text := DateToStr(Date); // Data de cadastro padrão
  edtGidMedico.Text := '0'; // Indica novo registro
  EdtCPF.SetFocus;
end;

procedure TformCadMedicos.CarregarGrid;
begin
  FDataSource.DataSet := FMedicoController.CarregarMedicosParaGrid;
end;

procedure TformCadMedicos.FormCreate(Sender: TObject);
begin
 FMedicoController := TMedicoController.Create; // O create da Query recebe a conexão e não nil
  FDataSource := TDataSource.Create(Self);
  gridCadastroMedico.DataSource := FDataSource;
  CarregarGrid;
  LimparCamposEControlarBotoes(csNavegando);
end;

procedure TformCadMedicos.LimparCamposEControlarBotoes(AState: TCadastroState);
begin
  // Limpar campos
  if AState <> csEditando then // Não limpa se estiver editando, pois os dados já foram carregados
  begin
    edtNome.Clear;
    edtCPF.Clear;
    edtTelefone.Clear;
    edtDataCadastro.Clear;
    edtGidMedico.Clear;
    edtCRM.Clear;
  end;

  // Habilitar/Desabilitar campos
  edtNome.Enabled := (AState = csInserindo) or (AState = csEditando);
  edtCPF.Enabled := (AState = csInserindo) or (AState = csEditando);
  edtTelefone.Enabled := (AState = csInserindo) or (AState = csEditando);
  edtDataCadastro.Enabled := False; // Geralmente não editável diretamente
  edtCRM.Enabled := (AState = csInserindo) or (AState = csEditando);


  // Controlar botões
  BtnIncluir.Enabled := (AState = csNavegando);
  BtnEditar.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnExcluir.Enabled := (AState = csNavegando) and (FDataSource.DataSet.RecordCount > 0);
  BtnSalvar.Enabled := (AState = csInserindo) or (AState = csEditando);
  BtnCancelar.Enabled := (AState = csInserindo) or (AState = csEditando);

  //if AState = csNavegando then
  //gridcadastropaciente.SetFocus;
end;

end.
